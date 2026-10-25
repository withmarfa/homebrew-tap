# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.37/marfa-0.0.37-darwin-arm64.tar.gz"
      sha256 "5552ac1fade859dce8f8e6b9d83be3e8c7604e7108a1950f0050f51c4d3b2f03"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.37/marfa-0.0.37-darwin-x86_64.tar.gz"
      sha256 "55588c2a7e448a84d7a0446c600057e368583b651743e919768cc0e701a23554"
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
