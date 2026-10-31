# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.49/marfa-0.0.49-darwin-arm64.tar.gz"
      sha256 "b101656ada22dfaeb306cf138f1765f8a761e8d15170a87505f83c56a8d47d5e"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.49/marfa-0.0.49-darwin-x86_64.tar.gz"
      sha256 "3f497e2d0989654cda54cfd004a9e690e462f2d2ab1898c5c1e5831b0af6436f"
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
