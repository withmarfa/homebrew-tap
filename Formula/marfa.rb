# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.115/marfa-0.0.115-darwin-arm64.tar.gz"
      sha256 "eee5276248aab62a8932010254f536e29b04582ae20aaad848c195d1aad62313"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.115/marfa-0.0.115-linux-aarch64.tar.gz"
      sha256 "9f31bfbcc3593913002df13bc9211f2a2dab2a03428c8ab8974973b1226fdf2d"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.115/marfa-0.0.115-linux-x86_64.tar.gz"
      sha256 "ef3fbbccc21f8ee46aaeca7357ba1e8194973bde592999bd109e53b5fc9d7afd"
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
