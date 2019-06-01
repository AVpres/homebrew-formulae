class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/MovIm/releases/2019-06-02.tar.gz"
  version "2019-06-02"
  sha256 "beddf4eed9d670a98987a99be1817b3f07fb455657d2fe0375d09615ccdda299"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/movim_2019-06-02.diff"
          sha256 "248d87c3f7dc65c02ca9bec0e35634b19ca83443e6f728dcb3132a3c2a32e394"
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
