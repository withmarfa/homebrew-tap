# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.59/marfa-0.0.59-darwin-arm64.tar.gz"
      sha256 "92a5c3132b586a170846797c9ce252cc52f6928330fbbf26a18d45a1824c06dc"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.59/marfa-0.0.59-darwin-x86_64.tar.gz"
      sha256 "bcf9ae77894c5933c35d032095cf13a6e522231c751d10661864625a5b8ba5c2"
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
