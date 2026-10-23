# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.27/marfa-0.0.27-darwin-arm64.tar.gz"
      sha256 "f178342ace8695b62ad6905b85a31fde43b502b0431adc90cc24375ba1cbe9dd"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.27/marfa-0.0.27-darwin-x86_64.tar.gz"
      sha256 "e63f32318d51788ac2a8435d8267a144136e8d98f9b26c7c4f04521bb6e8f39a"
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
