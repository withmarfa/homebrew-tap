# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.26/marfa-0.0.26-darwin-arm64.tar.gz"
      sha256 "d2a0827e1181b72fe96f98a772377d4fabc546be1b9909830e0ebbb5f0804175"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.26/marfa-0.0.26-darwin-x86_64.tar.gz"
      sha256 "cb3ccb87e2c9f2ff13a54e69a5008498dea742e81f15910bd3f2f419a2dfb1d7"
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
