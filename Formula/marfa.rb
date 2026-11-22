# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.93/marfa-0.0.93-darwin-arm64.tar.gz"
      sha256 "db3215f8393673cef0085354ead418646825ba63950100bb5b5e8bfebf580093"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.93/marfa-0.0.93-linux-aarch64.tar.gz"
      sha256 "56497e012a78db1b592c17225f8396e14288b1b7fd822cc4ed72aec4610cdbc3"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.93/marfa-0.0.93-linux-x86_64.tar.gz"
      sha256 "e0d955cacf39e01432bc0521f80bbe42668810de71a7a8d3d4e9ece8a702d406"
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
