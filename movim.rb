class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2019-12-21.tar.gz"
  sha256 "c74fa2aefa857e46fa1312d7f2d85ae6733fcd658772f70b99f727f91ef255b1"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/movim-2019-12-21.diff"
          sha256 "c817355ab17f36de2b5172e95a453e3ed2d53b5c1361e3bc0e5afdc20d24b3fb"
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
