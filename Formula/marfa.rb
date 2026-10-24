# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.30/marfa-0.0.30-darwin-arm64.tar.gz"
      sha256 "f4300d54c4c0c3e7e4940079144cf57ef710758cb094e71f75acc2581d3b1f75"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.30/marfa-0.0.30-darwin-x86_64.tar.gz"
      sha256 "7243336f8caa18e92cc98fa5d2a66741e892c90bad534dd0d098f7db0323d57f"
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
