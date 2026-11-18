# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.79/marfa-0.0.79-darwin-arm64.tar.gz"
      sha256 "62e3d2de260d9147572bea31042eeeeb6da95992b148cb792ecadc1d82a6ff9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.79/marfa-0.0.79-linux-aarch64.tar.gz"
      sha256 "9d1929b5a1afda8bfafb2f351f3da59212a2ad53a8009d6480ec6e88cfca3c75"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.79/marfa-0.0.79-linux-x86_64.tar.gz"
      sha256 "84372448130f262dc718685a37d5068f5d8179716c8313a649acbb7b522e9ac3"
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
