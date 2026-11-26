# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.112/marfa-0.0.112-darwin-arm64.tar.gz"
      sha256 "b8a5375e511f13bc120a2afdf31be368fc214110b854ad129ffc5e2f4658a260"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.112/marfa-0.0.112-linux-aarch64.tar.gz"
      sha256 "d64c80bfed74eb1a89a902477740cc8b0aaef7a40eb13c4e4ebad66590329c2f"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.112/marfa-0.0.112-linux-x86_64.tar.gz"
      sha256 "8c3285e2e14ca7accbdaec52487199b7ab208a0c4746ffafeaec5d65c9d1e717"
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
