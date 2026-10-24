# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.29/marfa-0.0.29-darwin-arm64.tar.gz"
      sha256 "886420811ac476cf69a99723776c37af3f05c9156dbcefb46485c5f76c9bffa0"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.29/marfa-0.0.29-darwin-x86_64.tar.gz"
      sha256 "2816f677df6cc5b4a922e3e06f156a2f455f60ac466c6282ead37970e157dbf0"
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
