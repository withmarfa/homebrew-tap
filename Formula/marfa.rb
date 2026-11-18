# Written by the release workflow of withmarfa/marfa from the release's
# checksum file. A change made here by hand is replaced by the next release.
class Marfa < Formula
  desc "Command-line interface and server for Marfa, a self-hosted personal data store"
  homepage "https://github.com/withmarfa/marfa"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.80/marfa-0.0.80-darwin-arm64.tar.gz"
      sha256 "d51feb1f14a01765afb5278fb6f75f3a3d69f72129c5afbcdeb13ca737ac69d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.80/marfa-0.0.80-linux-aarch64.tar.gz"
      sha256 "858a4a489ba40b02a8da45af01e132fffca63986bc943224569ed1d8e576cd20"
    end
    on_intel do
      url "https://github.com/withmarfa/marfa/releases/download/v0.0.80/marfa-0.0.80-linux-x86_64.tar.gz"
      sha256 "6ca52a458ad1d714fea94d88507232035d8b9070b27129ca8e2e6c1c08236faa"
    end
  end

  def install
    bin.install "marfa", "marfa-server"
    doc.install "NOTICES.txt"
  end

  def caveats
    <<~EOS
      Set up a server on this machine:
        marfa server install
    EOS
  end

  test do
    assert_match "marfa #{version}", shell_output("#{bin}/marfa --version")
    assert_match "marfa-server #{version}", shell_output("#{bin}/marfa-server --version")
  end
end
