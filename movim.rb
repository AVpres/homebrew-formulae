class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/MovIm/releases/2019-06-15.tar.gz"
  version "2019-06-15"
  sha256 "5c76565351376eb62d5f1eb74379cf22d2bd22016a2d909af5e3e83b1b0ab781"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/movim_2019-06-15.diff"
          sha256 "0473a00f38c8148af8899669045cf0f00a489a720889528a0ce5766b3a79945f"
        end
        system "make", "install"
      end
      bin.install "openmovim"
    end
    cd "doc" do
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
