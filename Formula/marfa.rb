# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.87/marfa-0.0.87-darwin-arm64.tar.gz"
      sha256 "0542ea8e577cb1281e758119d4ad870114d61a9ca2fb9332c7e5e2a1f68f758b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.87/marfa-0.0.87-linux-aarch64.tar.gz"
      sha256 "5d11397cc0959384070e346cddf1de567837cdb47099d53a827fe4a8dcaa4491"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.87/marfa-0.0.87-linux-x86_64.tar.gz"
      sha256 "5886831bb368474772188f06a23959d6679499bdb24b2f24642765f0569120a8"
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
