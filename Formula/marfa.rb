# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.40/marfa-0.0.40-darwin-arm64.tar.gz"
      sha256 "98b3c0714f242c26e043e92a9d4e2b2bbf31663985b4cf91a425e3bdce8d915c"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.40/marfa-0.0.40-darwin-x86_64.tar.gz"
      sha256 "fa6cda8962422495803ebfed5d32bae11737b6c929e6e0535ddfb08e0a7ffce0"
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
