# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.105/marfa-0.0.105-darwin-arm64.tar.gz"
      sha256 "fdbbf6450dd2b117f67f8e1f096d350d26d0ed51127b484b743f2e421333a449"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.105/marfa-0.0.105-linux-aarch64.tar.gz"
      sha256 "836b085ccc4e31820e733d4d9b17e731682c91359b4de9810b2b21ebc12ce4b2"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.105/marfa-0.0.105-linux-x86_64.tar.gz"
      sha256 "03b836488d200ccc430f5b7526b0584959ee807c37b0dd105450c24473f4fd7a"
    end
  end

  def install
    # The server looks for cloudflared beside itself, so the three programs stay together
    # in libexec and only the two commands are linked. Homebrew's own cloudflared is left alone.
    libexec.install "marfa", "marfa-server", "cloudflared"
    bin.install_symlink libexec/"marfa", libexec/"marfa-server"
    doc.install "NOTICES.txt"
  end

  def caveats
    <<~EOS
      Set up a server on this machine:
        marfa server install
    EOS
  end

  test do
    assert_match "marfa #{version}", shell_output("#{bin}/marfa --version")
    assert_match "marfa-server #{version}", shell_output("#{bin}/marfa-server --version")
    assert_match "cloudflared version", shell_output("#{libexec}/cloudflared --version")
  end
end
