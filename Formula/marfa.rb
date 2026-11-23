# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.102/marfa-0.0.102-darwin-arm64.tar.gz"
      sha256 "e3e5bdd550073673c9349f4dbb3eee7b86e7706a3872f6883ed0264d87f1f823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.102/marfa-0.0.102-linux-aarch64.tar.gz"
      sha256 "3eb185806a18a5808f1f1af68a2a668a25f8379a0838c69309aa54546b21c76b"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.102/marfa-0.0.102-linux-x86_64.tar.gz"
      sha256 "4918862b39573daaa56775fb8bcd4694dd7670217988dcac5a16c32c5f6bc66b"
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
