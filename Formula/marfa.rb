# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.96/marfa-0.0.96-darwin-arm64.tar.gz"
      sha256 "2636b0b12bc50f3333f19e99b28dad55e00a0ca7f40d20f4b5ab6267e3f725b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.96/marfa-0.0.96-linux-aarch64.tar.gz"
      sha256 "8d5b98bffe76abc80984db7aa5e9d8626eda9abdd444be623c7d8afafad3e7e0"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.96/marfa-0.0.96-linux-x86_64.tar.gz"
      sha256 "22f123a0cf3f3e20ab8d312a444523e1f828183127fb681b0a8469b4d942e3d8"
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
