class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2022-12-03.tar.gz"
  sha256 "14751cd629042ae2ec59fedab5bae580800bca57e0b04eb647e5125f7fd88183"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2022-12-03.diff"
        sha256 "136fb7351839ea1976c21a4e3bc87509e5562ece7abd30489a64b90bc6fe743a"
      end
      system "./configure"
      system "make"
      lib.install Dir["lib/*"]
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
