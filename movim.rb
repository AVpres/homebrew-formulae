class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2022-01-22.tar.gz"
  sha256 "b2789b55cfb8186724de428bc5ca98353e9badb87e9121d5e4617a0378e0987e"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2022-01-22.diff"
        sha256 "292155da84e41b0186229df0b5a65c2f1f6d044104e0e93b233f66748d3cf751"
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
