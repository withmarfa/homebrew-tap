# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.60/marfa-0.0.60-darwin-arm64.tar.gz"
      sha256 "b0b996e74473a3a45688796672ba8ab385f4a15daa17d73923cec1ecefc5303b"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.60/marfa-0.0.60-darwin-x86_64.tar.gz"
      sha256 "bb135935051c1defb279baf766e85f4a29e7f227fea452ad3d8f955c67308690"
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
