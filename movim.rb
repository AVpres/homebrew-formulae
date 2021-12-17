class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2021-12-18.tar.gz"
  sha256 "8a6cf079c7e2d72f5de1d649d6168a55fd579fdd3d96f44f3cb946be71bb8227"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2021-12-18.diff"
        sha256 "0e8f2bb096d08fd385c88ce305e8a86d97605beefc75b80c1b361ed0558d72f1"
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
