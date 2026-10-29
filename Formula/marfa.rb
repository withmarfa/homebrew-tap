# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.47/marfa-0.0.47-darwin-arm64.tar.gz"
      sha256 "6b1731f89fb477a8cef8580c491d43b15d42f1673202b20daaddd34a0dd4ab2d"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.47/marfa-0.0.47-darwin-x86_64.tar.gz"
      sha256 "35c2073b907719dc6af0e6474a73555345a5fdbc29041538026e420954787bfb"
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
