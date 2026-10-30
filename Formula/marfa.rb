# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.48/marfa-0.0.48-darwin-arm64.tar.gz"
      sha256 "c461b49b272f0696195eaa4b18801e74f7d14c06f7e72603347e9cb3469ed238"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.48/marfa-0.0.48-darwin-x86_64.tar.gz"
      sha256 "6757af1cf1cc863e130703f9e772574ad3e5e333a280fbdf9a2c3a84a8d9bf2e"
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
