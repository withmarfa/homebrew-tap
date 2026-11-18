# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.78/marfa-0.0.78-darwin-arm64.tar.gz"
      sha256 "beb4bcbe95bb3b90674798219295a9432105753ea07565f2fa20a7833c32abac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.78/marfa-0.0.78-linux-aarch64.tar.gz"
      sha256 "769a771b79cea84c48a51e2dd5b9f7c392a8698de5016c7e2c85c1b8d8f9c86a"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.78/marfa-0.0.78-linux-x86_64.tar.gz"
      sha256 "e3c6d7dd7162cc4b97f961675cf8f38b6a1a1261ba05a6ae39f6968878536be6"
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
