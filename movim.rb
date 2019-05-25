class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/MovIm/releases/2019-05-25.tar.gz"
  version "2019-05-25"
  sha256 "198beeb1bbc78ddd3ee0ccdb88ae45a22ac4fd921b0512788dca9a3e3ec3f775"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Please login for a full installation."
      else
        patch do
          url "https://avpres.net/patch/movim_2019-05-25.diff"
          sha256 "8d0c91626c1500103c3f17023855c197cf1860a97629c21bd90da05805a25a35"
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
