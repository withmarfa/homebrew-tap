# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.108/marfa-0.0.108-darwin-arm64.tar.gz"
      sha256 "a690186bb0c8363a954a9f95bade96349418ac3aeadc1a731cc3252f36c50a8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.108/marfa-0.0.108-linux-aarch64.tar.gz"
      sha256 "6a5835035af6a8e23a6cf0c6180bba6dea57a093d6ce5c11d63b98160f69d1ad"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.108/marfa-0.0.108-linux-x86_64.tar.gz"
      sha256 "968ce15298997c017733f95d1961cf6862a7f358d0083bfbee25f3580b308d11"
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
