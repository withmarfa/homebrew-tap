# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.24/marfa-0.0.24-darwin-arm64.tar.gz"
      sha256 "345d43975df132c1c08137abea141da67df69f59d8d2e021a8a5fc7965e4d7c5"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.24/marfa-0.0.24-darwin-x86_64.tar.gz"
      sha256 "a8c5b45f67823919772e3ddf74d0252d8b94c9ca3bab3d84a532e339f46ab34a"
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
