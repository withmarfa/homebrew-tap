# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.52/marfa-0.0.52-darwin-arm64.tar.gz"
      sha256 "e513f584944aff2725a89a08f8f0ac5bf2fe1a9cc78ff893aa986c775f328e02"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.52/marfa-0.0.52-darwin-x86_64.tar.gz"
      sha256 "20c6054318be1f27423c0ba517b085f0316c8d82899bb63ca4944c82b7867144"
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
