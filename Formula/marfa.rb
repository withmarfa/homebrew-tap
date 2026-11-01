# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.53/marfa-0.0.53-darwin-arm64.tar.gz"
      sha256 "4389ee5976037f9b372ecad4258f613e33f5a7fbc27a3fb3a82b8409c771ea76"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.53/marfa-0.0.53-darwin-x86_64.tar.gz"
      sha256 "55fb3f5ae0032b55cb7e2d685f8d5baedac8d543c77994746170cfc2be6ccf74"
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
