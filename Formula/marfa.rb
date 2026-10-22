# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.25/marfa-0.0.25-darwin-arm64.tar.gz"
      sha256 "2dba3ef7537fb8e8f63f0d79f0d6a885b975bfe3a07887da41e0d96604f49408"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.25/marfa-0.0.25-darwin-x86_64.tar.gz"
      sha256 "fae7bbd1ee84f8f1902ec32561f46adc829b962e69df5c27d9669d4d0651be4f"
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
