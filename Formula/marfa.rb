# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.64/marfa-0.0.64-darwin-arm64.tar.gz"
      sha256 "ccf92bdd2cf2a036e79fec6bd844d0447d2677e3c058b9f2d38b27834b4d6ee7"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.64/marfa-0.0.64-darwin-x86_64.tar.gz"
      sha256 "3cc39c5ff011a4678999ac56f7b94a2b52e62ba6690b459e3d86eed9b4799777"
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
