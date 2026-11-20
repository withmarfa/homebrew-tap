# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.88/marfa-0.0.88-darwin-arm64.tar.gz"
      sha256 "5e5e83fefccae4c33d974b71978a01b3222139d1373715697eb2ef9007d4f840"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.88/marfa-0.0.88-linux-aarch64.tar.gz"
      sha256 "4d750d62c14831c49cd56161f5a731a76b167729d8dd4a53502ca02a5892203c"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.88/marfa-0.0.88-linux-x86_64.tar.gz"
      sha256 "31cfc91d72ef12257a2dcfda565a8a7b512d74423aecbb48a139bc0c9a2b90a8"
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
