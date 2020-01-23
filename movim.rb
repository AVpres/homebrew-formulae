class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2020-01-25.tar.gz"
  sha256 "c1a0457ce356dc0c67cf4ca696719706d9aa968b0baec4c7b74875309336b4f8"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/movim-2020-01-25.diff"
          sha256 "9c97c06bc7bf7c7f858296be2acb4b7ccfe484cd951e4db606f05255de17b67d"
        end
        system "./configure", "--prefix=#{prefix}"
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
