# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.109/marfa-0.0.109-darwin-arm64.tar.gz"
      sha256 "67206dcaba25d79a3a8f0aca9d413b86744ca98e40a1e4f5179db3392ce57055"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.109/marfa-0.0.109-linux-aarch64.tar.gz"
      sha256 "d302497a6acb3d2f68ab15fa21968c3e28bd3a4f7e5490bc1ebba4e4e77a9342"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.109/marfa-0.0.109-linux-x86_64.tar.gz"
      sha256 "0b6221b656a0058a186e3500e5fb46198570fdad00b5d25b0e0364b531e26809"
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
