# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.94/marfa-0.0.94-darwin-arm64.tar.gz"
      sha256 "c342b95b979daf77272b0af9750ba59d966813f29bb5b8c5e2b4a73bc57c1264"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.94/marfa-0.0.94-linux-aarch64.tar.gz"
      sha256 "337ef0cd52c35618e136fc1d940ae0bee62094758a743fdc0097a790fccb522d"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.94/marfa-0.0.94-linux-x86_64.tar.gz"
      sha256 "e90b8bffcfb132b7621c7b8f67655fd55b38e9f5add85c3328357322bb6df461"
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
