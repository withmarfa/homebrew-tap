# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.33/marfa-0.0.33-darwin-arm64.tar.gz"
      sha256 "30c13339aafd417e08c0156b560a2e117755fe162789f114117b649f5068f9ee"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.33/marfa-0.0.33-darwin-x86_64.tar.gz"
      sha256 "47cb65e86e27ef930e8e64ab3666425a644acf4aa3bbf6e33f37b884f70c125c"
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
