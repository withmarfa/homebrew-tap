# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.51/marfa-0.0.51-darwin-arm64.tar.gz"
      sha256 "a4331b487db3069e28a6d305174391056a5c5d55df0b2e6686774810443fac9d"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.51/marfa-0.0.51-darwin-x86_64.tar.gz"
      sha256 "a2a685037fc82999e0ff15f0ae9e5a5b903bf3f97d37109377e60191d9a9df5e"
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
