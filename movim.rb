class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2020-08-21.tar.gz"
  sha256 "f4c5afecc880bf78fb9acd46110d4d18442b5825387566947a7767736f490624"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2020-07-11.diff"
        sha256 "93e3484594e2fb161d99677bde3175ac2ad28e01c1c3e51c8d6be9de94f7e85b"
      end
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
