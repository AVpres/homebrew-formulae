class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/MovIm/releases/2019-05-04.tar.gz"
  version "2019-05-04"
  sha256 "3bf74acf0ce2d915fa8cef40d6650311bbee9d4f3e2649420637479ac15ec1c8"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Sorry, the MovIM codec cannot be installed. Please login."
      else
        patch do
          url "https://avpres.net/patch/movim_2019-05-04.diff"
          sha256 "2bcfd1b96711ac7772f673ef23a8d179062446f02be3a752d62685b0cb8a0a96"
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
