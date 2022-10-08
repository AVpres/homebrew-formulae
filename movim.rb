class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2022-10-08.tar.gz"
  sha256 "cb693c346caff06fc84db21bb503d618233b8624865f363a94fc8df03931e5f1"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2022-10-08.diff"
        sha256 "042c22d5b89ddc0141108916ac34331668b6dcb2bc848a8520385c9a0bb0a680"
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
