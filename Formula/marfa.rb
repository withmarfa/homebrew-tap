# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.44/marfa-0.0.44-darwin-arm64.tar.gz"
      sha256 "3fdf9a9830d18baf50b49d8142e7a2054393fe240122c9d7442b748630111928"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.44/marfa-0.0.44-darwin-x86_64.tar.gz"
      sha256 "cd99004b2a27640bee5270e48ffa4cee446fec7e8b66991e0683447ffec31cf5"
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
