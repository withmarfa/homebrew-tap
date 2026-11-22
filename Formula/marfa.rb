# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.95/marfa-0.0.95-darwin-arm64.tar.gz"
      sha256 "93c1cc50db68e56be47b73fb5ba1e8bc5fe983316c03cd6afd6022f28c72ef2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.95/marfa-0.0.95-linux-aarch64.tar.gz"
      sha256 "89e86822d680e72aea74ac5461d268305b437bd1053a0c111b083a7a8e2d8be7"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.95/marfa-0.0.95-linux-x86_64.tar.gz"
      sha256 "965c695c8685123f393f6b23ba7b678e264fc142ef092beaffeaf9cd1a9b3bd6"
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
