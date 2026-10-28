# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.45/marfa-0.0.45-darwin-arm64.tar.gz"
      sha256 "0f88d00d66781e47b6ecbd970247fbf8eade8c5ff668525021ed970f08b32562"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.45/marfa-0.0.45-darwin-x86_64.tar.gz"
      sha256 "378edbd2536e72243a801dda5e4fe6e61878ebd5cfb6e1b83416611ac2b7352f"
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
