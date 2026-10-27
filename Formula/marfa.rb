# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.42/marfa-0.0.42-darwin-arm64.tar.gz"
      sha256 "a5dced5cd7d75964853b750b3e72202a9b05ab947faa5e96e009dc133643fe06"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.42/marfa-0.0.42-darwin-x86_64.tar.gz"
      sha256 "8db7c8587c0419b0466a93d51a3824cb17b19aa6bc50462721f64eb9cd8aa048"
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
