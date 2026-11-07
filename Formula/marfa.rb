# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.65/marfa-0.0.65-darwin-arm64.tar.gz"
      sha256 "625b9bed46bb96504a91b3dc1263a50559785aa619e849e9aecd319483cb617e"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.65/marfa-0.0.65-darwin-x86_64.tar.gz"
      sha256 "b6cfffd1d8dee726834562b91f6d417aa9900d24bec2c696ee6c0a4a8f73ef3d"
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
