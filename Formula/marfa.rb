# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.90/marfa-0.0.90-darwin-arm64.tar.gz"
      sha256 "6827984c0637598767d8d990f377794ae888ae26368cf2cbadf6d81157dacf7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.90/marfa-0.0.90-linux-aarch64.tar.gz"
      sha256 "a9e0c068ea9be34f47462b38e035b91486c07a57dcecd36152a48e1174fc0159"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.90/marfa-0.0.90-linux-x86_64.tar.gz"
      sha256 "c4f28a781de3714eb14d2a2ac8b302eef30c0d0f8f6d1325497f9cbb7d49fb9d"
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
