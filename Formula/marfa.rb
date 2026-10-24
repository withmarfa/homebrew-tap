# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.31/marfa-0.0.31-darwin-arm64.tar.gz"
      sha256 "6fd0e9086d83eb58c82da4eac3664d79e668145120af702f01fea2d4e3df32e5"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.31/marfa-0.0.31-darwin-x86_64.tar.gz"
      sha256 "d6a56a8b705843665fec5566feb1e6e8dca54d75d371f24201c31e2942880c67"
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
