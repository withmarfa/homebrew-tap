# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.81/marfa-0.0.81-darwin-arm64.tar.gz"
      sha256 "9683263c4d8bf1ba073a35dad4515272b490a0e986e6e93fc39630513e225251"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.81/marfa-0.0.81-linux-aarch64.tar.gz"
      sha256 "907197518645fc67ab88c97c7066ef571d94ad918175471fe3839290d1644258"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.81/marfa-0.0.81-linux-x86_64.tar.gz"
      sha256 "5dbd55a4b5c7c366ef05203208bc7e7e2101d29a5b7f0205669b67ca2ebfbda2"
    end
  end

  def install
    bin.install "marfa", "marfa-server"
    doc.install "NOTICES.txt"
  end

  def caveats
    <<~EOS
      Set up a server on this machine:
        marfa server install
    EOS
  end

  test do
    assert_match "marfa #{version}", shell_output("#{bin}/marfa --version")
    assert_match "marfa-server #{version}", shell_output("#{bin}/marfa-server --version")
  end
end
