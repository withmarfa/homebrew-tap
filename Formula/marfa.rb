# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.56/marfa-0.0.56-darwin-arm64.tar.gz"
      sha256 "30228ac197faf4b9161d22069d9e776c40e31c63b18b814c2741bf5a579d9a70"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.56/marfa-0.0.56-darwin-x86_64.tar.gz"
      sha256 "5811412eafac8fe8bcf1bf6e9b4e5e7e2daa52f1b21aa90970c3e69e169d49db"
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
