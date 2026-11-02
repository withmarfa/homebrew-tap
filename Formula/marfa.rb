# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.58/marfa-0.0.58-darwin-arm64.tar.gz"
      sha256 "d4db30223f6deb4c8fd7b7e4ac7ecf5ed95b44e5a7429dfe1bb90daeadc7f37d"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.58/marfa-0.0.58-darwin-x86_64.tar.gz"
      sha256 "dc39035a5236b09a506d79db8efd4e236e1efbf23691bb768cb60e89707875e3"
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
