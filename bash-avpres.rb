class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-11-10.tar.gz"
  sha256 "0553ee6a5dd7df923b4857174adef6de5d1b35a4fd4385412a20f40f71118c87"
  license "BSD-3-Clause"
  revision 1

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
