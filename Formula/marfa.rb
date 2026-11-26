# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.113/marfa-0.0.113-darwin-arm64.tar.gz"
      sha256 "2104a588c79be11fbc4d699b7e4d600b2032cabb8558d3faf86d279db343126c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.113/marfa-0.0.113-linux-aarch64.tar.gz"
      sha256 "f4224d0e83a0e0c3d73fc472f5fa0815e1e84a861457b5bcb41460f5c972144a"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.113/marfa-0.0.113-linux-x86_64.tar.gz"
      sha256 "97e954ff18e1794c2dfbc4aaea62259f61411c6096f36221c36f9b83e31f8c00"
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
