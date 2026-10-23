# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.28/marfa-0.0.28-darwin-arm64.tar.gz"
      sha256 "17c6392f19a2c16f6a625c6cb62b7abe4ae20d8a036e7a9e2c5ad8b590601197"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.28/marfa-0.0.28-darwin-x86_64.tar.gz"
      sha256 "83a2e3f66ef3e5a656da0c306f65a4f26cc97186863014f9527cdde62ce554af"
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
