class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-05-21.tar.gz"
  sha256 "4b1435b893fd65dfcfea0e46852ce47ba4444b9dadd725a972d58a9f89dc28a1"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system bin/"bash_avpres"
  end
end
