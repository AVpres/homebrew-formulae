class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2021-01-23.tar.gz"
  sha256 "fa5a827f54f5c8293c0abf526f32e04db9ac01e744922846cf6be2ed4c6fe69d"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2021-01-23.diff"
        sha256 "02fd59d176711e26317c43993b986fb7f592bee9a3c133ecf03cacccf036febb"
      end
      system "./configure"
      system "make"
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
