# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.62/marfa-0.0.62-darwin-arm64.tar.gz"
      sha256 "8c3d7c33b329901268d1fe1f8bef1774b4e7cb70bdb377dd17d89778cd5d1447"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.62/marfa-0.0.62-darwin-x86_64.tar.gz"
      sha256 "f0dfaea6d7753fb90777f11365cc63fb4871a4b94947803ad7829737654433b5"
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
