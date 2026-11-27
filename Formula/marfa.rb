# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.116/marfa-0.0.116-darwin-arm64.tar.gz"
      sha256 "fc345fe8577a049a643b4b86b83c535b9a0b76a6f5de6046927869cb9079e46c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.116/marfa-0.0.116-linux-aarch64.tar.gz"
      sha256 "9bf6f1b2bd02e0317f6d3519f98f24421ad1433bf5c20d8fcf170564d0d3e1ad"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.116/marfa-0.0.116-linux-x86_64.tar.gz"
      sha256 "843dc409d54083b6a141ea20ea5b630ae3d82f55b0778ad4a496210d2e181815"
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
