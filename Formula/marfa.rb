# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.118/marfa-0.0.118-darwin-arm64.tar.gz"
      sha256 "39c41769f6eab0b347e62928b5f5b8e68fffcb8b12a7a8da512f564ac1c6ebe1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.118/marfa-0.0.118-linux-aarch64.tar.gz"
      sha256 "6a0b48a7cdcfd56037683e8d69d60797e9b8241f32498ebbd0b7d0ad72325644"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.118/marfa-0.0.118-linux-x86_64.tar.gz"
      sha256 "6ed0a2340fe2bdd37d9bc79240f5236172ec514d2326410058a5c688614f5a6a"
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
