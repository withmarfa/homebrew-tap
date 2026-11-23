# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.100/marfa-0.0.100-darwin-arm64.tar.gz"
      sha256 "523404f4a778fcdefbfb47b72dbb96c9eff9a61f7fba1b00f138b76f4358ac08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.100/marfa-0.0.100-linux-aarch64.tar.gz"
      sha256 "028c895fd9295458d4e43e7eeaefb7a3b1408db55a9d5ac169ee17ee37092419"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.100/marfa-0.0.100-linux-x86_64.tar.gz"
      sha256 "5d16f0d7f420e2bfda8ff1531f77bb307a5e45fd80fe2cc9f005b7d32e162c94"
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
