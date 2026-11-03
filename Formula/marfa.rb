# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.61/marfa-0.0.61-darwin-arm64.tar.gz"
      sha256 "4b718dc5397204067a1b5351135c7a39bcd3ec4c99ebaa71c615267415d35195"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.61/marfa-0.0.61-darwin-x86_64.tar.gz"
      sha256 "ad5c67eaba795e1c2723d95e8c024644a0fb10427ccc6ab69559d202b4d5b6c7"
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
