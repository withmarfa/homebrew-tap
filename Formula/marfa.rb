# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.86/marfa-0.0.86-darwin-arm64.tar.gz"
      sha256 "b15d095b624285375f7c08d057fbbace8420fbcd25a77ab2c4363822cf13aaba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.86/marfa-0.0.86-linux-aarch64.tar.gz"
      sha256 "ac9350daf67dc97e9fa07be3c43642c8cb5855715c5345e74e1000fac9899e3e"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.86/marfa-0.0.86-linux-x86_64.tar.gz"
      sha256 "f9c18f4c3e21ce0b434e191895170fe702ca0b820c5c46cee962a33467eb48e6"
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
