# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.110/marfa-0.0.110-darwin-arm64.tar.gz"
      sha256 "c7c0e785249a3f7d51ad3492cd51950e5382a5d08d44edbb18fcc54796796dc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.110/marfa-0.0.110-linux-aarch64.tar.gz"
      sha256 "f4e5bffb70331bd0fd8cc911c25733bbb548ec83064d13dd27633d58c8c3515a"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.110/marfa-0.0.110-linux-x86_64.tar.gz"
      sha256 "50ca00c511a80ebe3916a82be51b02514477c9cf3fd64a34b157447ec2356e5f"
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
