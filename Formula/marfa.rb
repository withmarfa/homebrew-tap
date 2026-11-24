# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.104/marfa-0.0.104-darwin-arm64.tar.gz"
      sha256 "233613897e082cb816614d3752d65e9713b64b024ee2af3805f0411d8b3c6303"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.104/marfa-0.0.104-linux-aarch64.tar.gz"
      sha256 "ca19e80f82958c6dc4765047a100058b649b1e57d8aa16258002fbeffc87c6d8"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.104/marfa-0.0.104-linux-x86_64.tar.gz"
      sha256 "e62259effe1053464083438da25b8dd297087d44c5871f417789585f29f93ebf"
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
