# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.41/marfa-0.0.41-darwin-arm64.tar.gz"
      sha256 "29958a7dfafbc4706396f604d2ab60470c40c4fac5916c0743994f2957ec94b5"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.41/marfa-0.0.41-darwin-x86_64.tar.gz"
      sha256 "f7ac684a2d95eff1c17ff6f550bef062da604467bc869cfe9310a86d20451b7f"
    end
  end

  def install
    bin.install "marfa"
  end

  def caveats
    <<~EOS
      Set up a server on this machine with Docker:
        marfa server install
    EOS
  end

  test do
    assert_match "marfa #{version}", shell_output("#{bin}/marfa --version")
  end
end
