class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/MovIm/releases/2019-05-18.tar.gz"
  version "2019-05-18"
  sha256 "e55eea59cf80b828b6b8012023b9da2393da2c09ba378826a963c3c480dc34e8"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Sorry, the MovIM codec cannot be installed. Please login."
      else
        patch do
          url "https://avpres.net/patch/movim_2019-05-18.diff"
          sha256 "0fe8b758e89b308d6c3eaa4cce366a2c46e4149aa78729b62107c8827ee30e5b"
        end
        system "make"
        bin.install "libmovim"
        bin.install "movimdec"
        bin.install "movimenc"
        bin.install "movimplay"
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
