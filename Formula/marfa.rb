# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.84/marfa-0.0.84-darwin-arm64.tar.gz"
      sha256 "c8f5310a709c7d9701e2bee572dac357b925213588a56376369c406ff8343fcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.84/marfa-0.0.84-linux-aarch64.tar.gz"
      sha256 "90b45bffdf5c75c8ef03ccee523e2067237868cbbaf838a1d81d230bf3e8db31"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.84/marfa-0.0.84-linux-x86_64.tar.gz"
      sha256 "98025e94fa087e7570d80ea9e2c95477ef5956dc437edc28d320abc83794fbd3"
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
