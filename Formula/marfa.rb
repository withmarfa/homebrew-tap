# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.119/marfa-0.0.119-darwin-arm64.tar.gz"
      sha256 "80795dcc29c3c30838eb288e7c8566c8ec5e9e46e7c49ca555e60ca2de073f76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.119/marfa-0.0.119-linux-aarch64.tar.gz"
      sha256 "bba670ec6bd533594591b5d637293428d561c014c77a6e02b5397ed0e84f2ca8"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.119/marfa-0.0.119-linux-x86_64.tar.gz"
      sha256 "54f8cfc01d8dd01830bb0e43b597567b64139d7eaeeeb3510d95aba276eacca0"
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
