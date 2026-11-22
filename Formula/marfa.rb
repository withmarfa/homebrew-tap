# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.92/marfa-0.0.92-darwin-arm64.tar.gz"
      sha256 "c929af323f6e120f39ffc5e4f740c4567104ed256505d42fc6b6d98098b62e84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.92/marfa-0.0.92-linux-aarch64.tar.gz"
      sha256 "01119fda17a54cb76f0aee77504695344225584bcac76deb6b130261a5a38724"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.92/marfa-0.0.92-linux-x86_64.tar.gz"
      sha256 "be476645cd1b00741e86044589a076fe1ca78ebac27b309b14f6e4a0b74fbbd8"
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
