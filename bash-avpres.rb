class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-05-18.tar.gz"
  sha256 "e31370d77d1b4db9f7e1c4b43c65e5cb0d539f6dfc86b1302329101c52de1569"
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
