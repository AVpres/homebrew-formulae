class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2021-10-23.tar.gz"
  sha256 "fd1a3fd287c449be279ea0e68e3d56eb8224377ba320a4e255a25e29bfe81fcc"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2021-10-23.diff"
        sha256 "d42876e625d66ff6e1cacd12e77c7b1dff815fcbedd6d140d9071a7acfbeaccf"
      end
      system "./configure"
      system "make"
    end
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
