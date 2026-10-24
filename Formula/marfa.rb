# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.34/marfa-0.0.34-darwin-arm64.tar.gz"
      sha256 "4d37ec1a6db67a7cef91c4015ad61928b74e8906ef10e6bb1e77763539775955"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.34/marfa-0.0.34-darwin-x86_64.tar.gz"
      sha256 "83f779ad113dd9ea71a1bfcc0d315e5fd669e63a3430d92c560375aab0a17699"
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
