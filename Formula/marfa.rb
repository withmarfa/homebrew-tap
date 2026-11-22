# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.98/marfa-0.0.98-darwin-arm64.tar.gz"
      sha256 "95856667737601c19cd4dfb9bdc727de52547ef91ac3bb25449e23f3ea7dea5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.98/marfa-0.0.98-linux-aarch64.tar.gz"
      sha256 "b416de9b9356839c5549d9053f1c00352abb941d3d6cb65206573620c7b6b9de"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.98/marfa-0.0.98-linux-x86_64.tar.gz"
      sha256 "15350e5afbf5b01d3097beb2d16846ac6d6ec9b92dd0f30197edede48b77055f"
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
