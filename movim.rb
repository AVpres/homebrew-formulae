class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2022-05-14.tar.gz"
  sha256 "86f31d52480a87ec226d76d00d2bf617e2378f0a0a01c1cfe07d60bbe6ef967b"
  license "BSD-3-Clause"
  revision 1

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2022-05-14.diff"
        sha256 "c17394825f0d167f45908fcfb7aeb70ef9e36063d6a7f18e2ee1a5ca0238a4f8"
      end
      system "./configure"
      system "make"
      lib.install Dir["lib/*"]
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
