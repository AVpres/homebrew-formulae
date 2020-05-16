class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2020-05-16.tar.gz"
  sha256 "42c0d0bf92eed7113a37eb04334e45db7c35b1ad8c4a9a0597913df1e6177218"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/movim-2020-05-16.diff"
          sha256 "85e638545672727525faf387e108a0f38714177349faef7f283fcfd3c5a497b3"
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
