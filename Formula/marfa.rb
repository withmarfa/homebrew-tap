# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.114/marfa-0.0.114-darwin-arm64.tar.gz"
      sha256 "a9c87bfa59133492af08f2c5ea5c153c26ca1e0687bb804259c4f3978a6b98d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.114/marfa-0.0.114-linux-aarch64.tar.gz"
      sha256 "e9697f96a5e78e1fd7115bf7f4d5bfa403541d0e2eeba547704d4da8faf86022"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.114/marfa-0.0.114-linux-x86_64.tar.gz"
      sha256 "ca46152918ee3b85507fecb16cca0a4f0f74e4458145a5859c4e130930af1d36"
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
