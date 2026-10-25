# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.38/marfa-0.0.38-darwin-arm64.tar.gz"
      sha256 "9efe737073e98a904c1165eafee7d26b9ff4a91f5905a8f1cb9bc4d0f5b3de46"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.38/marfa-0.0.38-darwin-x86_64.tar.gz"
      sha256 "df4e8d65f3adbdbc2fc478238c4d3b21a88ef78905257bcb0f561d723396d8bc"
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
