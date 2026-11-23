# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.99/marfa-0.0.99-darwin-arm64.tar.gz"
      sha256 "bc9de6f1854511cbe35916d595906507a395c6d5b24a58730aa01aa100ea0247"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.99/marfa-0.0.99-linux-aarch64.tar.gz"
      sha256 "8e317a5a4159c2e99e2392108088efd948ea122e35d0b5521ddfefb6d8237f97"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.99/marfa-0.0.99-linux-x86_64.tar.gz"
      sha256 "a028abf25fe9eb1b10203d1ddd9a15a1c5eb9ba87c1558088686bd64489c950a"
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
