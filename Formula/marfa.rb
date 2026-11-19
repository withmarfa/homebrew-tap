# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.82/marfa-0.0.82-darwin-arm64.tar.gz"
      sha256 "7966aec46855340b6d487db4cae92c73492bb013ff7920c5a2ec428c103c4609"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.82/marfa-0.0.82-linux-aarch64.tar.gz"
      sha256 "c55477b64f8bd9c189dc459acb792522b3bcd0c729a26a26698c4337806d682b"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.82/marfa-0.0.82-linux-x86_64.tar.gz"
      sha256 "790632dc31f6222be22cc25917f7a9cca6a980f25705fa68ca2079d626c06f59"
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
