class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2019-08-03.tar.gz"
  sha256 "86e70f08688dc5c6993f91302483ca6293a9cf54cd2a64db8931634aa8c149d4"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/movim-2019-08-03.diff"
          sha256 "fab8fe92c5f38a0a948aeeae42bca91e095be03549d17459e765e1513d6d1586"
        end
        system "./configure"
        system "make", "install"
      end
      bin.install "openmovim"
    end
    cd "man" do
      man1.install "libmovim.1"
      man1.install "movim.1"
      man1.install "movimdec.1"
      man1.install "movimenc.1"
      man1.install "movimplay.1"
      man1.install "openmovim.1"
    end
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
