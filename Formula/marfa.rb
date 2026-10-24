# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.32/marfa-0.0.32-darwin-arm64.tar.gz"
      sha256 "62d1f15258e69e75a2daffb723075277eeb1d27c699d48d6afce5e7076479e0d"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.32/marfa-0.0.32-darwin-x86_64.tar.gz"
      sha256 "26a444785283f7f0da666a654ebf013cbebd67d661e1194a875975b322bee792"
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
