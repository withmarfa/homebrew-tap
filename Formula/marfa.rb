# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.50/marfa-0.0.50-darwin-arm64.tar.gz"
      sha256 "e5a6023ab4e9e4f2b3203b17d14a543340143728d1a64b698cad5b1cb138447b"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.50/marfa-0.0.50-darwin-x86_64.tar.gz"
      sha256 "0b8aec53288425ccb1c35818671da4f7c9ee479345b714dabeba28a5b4d3ac42"
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
