# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.103/marfa-0.0.103-darwin-arm64.tar.gz"
      sha256 "55a5570c73e626221f59c18d0a85ccc0309c7cec08ac81bb565db2c656a5c9ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.103/marfa-0.0.103-linux-aarch64.tar.gz"
      sha256 "500ee96bdfd8b02825d2dd62dedc4c491e3c6f69852835022d55e1b69b2fa1d9"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.103/marfa-0.0.103-linux-x86_64.tar.gz"
      sha256 "0219d63bccd0ec621e5431b0b325fa46a62e1ee4ad65b27b86f927311f00808c"
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
