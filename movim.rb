class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/MovIm/releases/2019-05-11.tar.gz"
  version "2019-05-11"
  sha256 "b3e3219ed2816e5315371a31b512baa2abb8ccac6db5019af1aaae9665812f41"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Sorry, the MovIM codec cannot be installed. Please login."
      else
        patch do
          url "https://avpres.net/patch/movim_2019-05-11.diff"
          sha256 "1b977198eb7e57275d7db2719b4c5925dcf3efe739cdb4e3735113d805c06d05"
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
