# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.46/marfa-0.0.46-darwin-arm64.tar.gz"
      sha256 "c9e5bd5ebb3d09d3d24093ab30fbf9694bbafd11d6724686e6437c428b964472"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.46/marfa-0.0.46-darwin-x86_64.tar.gz"
      sha256 "db9ba17f336f3a9c819b386a84b7577e48c1fb61b5e5eb5f485706bacc107c4e"
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
