# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.35/marfa-0.0.35-darwin-arm64.tar.gz"
      sha256 "529cf2810ecfd8f6a5146c13f51d4c83b98af76dc928dad73860d72f75b72b0e"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.35/marfa-0.0.35-darwin-x86_64.tar.gz"
      sha256 "e4011f9c336f39b8b4b90dc676ce12c9741c85570b6770d76569399d10ab9174"
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
