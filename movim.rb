class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2020-09-01.tar.gz"
  sha256 "c110a94e7167746bc1e493cd43d2f42aeb4fb17b435079e755cf0c687525ae08"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2020-09-01.diff"
        sha256 "43b3573bee71dacb0fba41e2807faeeb6e7a096fe2241b551a41f490be399c8e"
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
