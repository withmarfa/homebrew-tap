# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.43/marfa-0.0.43-darwin-arm64.tar.gz"
      sha256 "9878248f15d4a023e63b0f2c3daf07f2f9785db235f99ace3d4b4a228cac8571"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.43/marfa-0.0.43-darwin-x86_64.tar.gz"
      sha256 "13bd19f7c2b2618c987a067a7c617ba62077927f08eb34947dbabf73c7cdaa78"
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
