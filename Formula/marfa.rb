# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.101/marfa-0.0.101-darwin-arm64.tar.gz"
      sha256 "ee2529b45434e4cc88118d7457f738d3168ff8ef219d42aa7bd3320c8a38a888"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.101/marfa-0.0.101-linux-aarch64.tar.gz"
      sha256 "80ec59366d5a4c85c7e38920f36d6428cec580919e13aabe2849924e0e849f1c"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.101/marfa-0.0.101-linux-x86_64.tar.gz"
      sha256 "d44f4fa4a94f24d839550efe0eca70f97eb41818f79610936b4204509e61f773"
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
