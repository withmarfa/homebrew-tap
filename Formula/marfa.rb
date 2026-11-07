# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.66/marfa-0.0.66-darwin-arm64.tar.gz"
      sha256 "daea88cd01d292de0864c5dfa47317300bf3032176f88e6f69f412ac97393142"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.66/marfa-0.0.66-darwin-x86_64.tar.gz"
      sha256 "4adfeb0f6c2bd8b42107b7edc614a2c080ea80d5b6401e7e2e3616de7a5cca72"
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
