# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.39/marfa-0.0.39-darwin-arm64.tar.gz"
      sha256 "46396a1910bb401297a772ea838e21798e1bc131c4fd3acb1520ac0bd9c77876"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.39/marfa-0.0.39-darwin-x86_64.tar.gz"
      sha256 "1a3cfd7938825926b5196be941984f2004506d3b301d5d1d00d7e557ced5c4c0"
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
