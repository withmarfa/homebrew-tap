# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.55/marfa-0.0.55-darwin-arm64.tar.gz"
      sha256 "a34d9b525efcd2c647118d897a86140b8979862c206ae33e7754c2ab106a1949"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.55/marfa-0.0.55-darwin-x86_64.tar.gz"
      sha256 "00a13688ad078822016ffb89990eb31d205e25a45fc65f8e0e57a23021d4a9ff"
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
