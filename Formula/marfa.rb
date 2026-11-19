# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.83/marfa-0.0.83-darwin-arm64.tar.gz"
      sha256 "b0bb0f43c0067756b469c5ad35dbf5570a191703aaf24ff80b0d107d10231782"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.83/marfa-0.0.83-linux-aarch64.tar.gz"
      sha256 "17bf28182327b9e9cb9edd2b9bd7fcdd7d5e03f16566e31cdc4852d2c838e1a4"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.83/marfa-0.0.83-linux-x86_64.tar.gz"
      sha256 "f10b3c7bc574b0b89d1eed09b494b816af8ebed1fdb277c561f03f6493631944"
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
