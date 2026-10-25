# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.36/marfa-0.0.36-darwin-arm64.tar.gz"
      sha256 "2d64fd63bfd19c1d1334ed99859c88fd780aeee5d138ec0b5ef11b0952fa7750"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.36/marfa-0.0.36-darwin-x86_64.tar.gz"
      sha256 "672245557d1bc9666fea18bddb5ca760c99012ff6dd727a479422a8a03fa9500"
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
