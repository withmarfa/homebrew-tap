# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.89/marfa-0.0.89-darwin-arm64.tar.gz"
      sha256 "7e010600354d15b872ec14b265794689e6e55ab9013cd89a993f1628042bfbfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.89/marfa-0.0.89-linux-aarch64.tar.gz"
      sha256 "ac82b9b6b366ee7b912b794f05d566b96c9cb838d921dce6ce017ca0386654c4"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.89/marfa-0.0.89-linux-x86_64.tar.gz"
      sha256 "7d1d290645fa58cf7c93b32a419412c3c3adf25840bc2fedf77c531ca5629de9"
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
