# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.111/marfa-0.0.111-darwin-arm64.tar.gz"
      sha256 "311e35e15b8003a6c3cad6093374d5feed8d35edb318c62d9ab9ebfe2e11e405"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.111/marfa-0.0.111-linux-aarch64.tar.gz"
      sha256 "1a7680dfa4ae290afa8236b00267392ea2a24065c5fc1b8ad8c55f9037b4629a"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.111/marfa-0.0.111-linux-x86_64.tar.gz"
      sha256 "1a11d4d854bd962152f3bfc67e3c18b7e8243a9c544da4f341c8bfc91d4d5551"
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
