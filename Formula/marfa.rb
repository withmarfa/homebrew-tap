# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.117/marfa-0.0.117-darwin-arm64.tar.gz"
      sha256 "abf8d94a76b818ff7d0c113d909305defede33107a707c21db46a02ade541f49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.117/marfa-0.0.117-linux-aarch64.tar.gz"
      sha256 "b9c28ef5afa592453aeea433d41dc57ff7704f4ddc56d43d0eba5658a75f30fc"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.117/marfa-0.0.117-linux-x86_64.tar.gz"
      sha256 "fca4d0c3806af38e5e54c45fea272aff57549868c1a711a43d8252a162b58891"
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
