class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2020-11-07.tar.gz"
  sha256 "69903ea2a5eef5e8952265d5d4643f5b58ae4aa77e094610d042253c6376a67e"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2020-11-07.diff"
        sha256 "3549475a9ab27847f42b746042d0ccb9e95972972f31c93cd585eb65833c8862"
      end
      system "./configure"
      system "make"
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
