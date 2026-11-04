# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.63/marfa-0.0.63-darwin-arm64.tar.gz"
      sha256 "d9cae3fd2728d483176c4c1f798e93ee7a3476e4956cb12ee4655d0c6418a7e2"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.63/marfa-0.0.63-darwin-x86_64.tar.gz"
      sha256 "45fd3c6a9dca2746f43e10250cd6e926830f9728788077c0b9350bfa9b14b086"
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
