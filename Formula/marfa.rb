# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.23/marfa-0.0.23-darwin-arm64.tar.gz"
      sha256 "907a60a0de4731eec97391325c5b32847175916a3c9b1b5cce2fb635fc007ff0"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.23/marfa-0.0.23-darwin-x86_64.tar.gz"
      sha256 "bf6dcaf051b20f6a1f9d02134fc4f7ee3fb3d9da8a0aa6e1bcb053bd9ac60842"
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
