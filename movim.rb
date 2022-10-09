class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2022-10-09.tar.gz"
  sha256 "42dcfb91f37411f3292cb9d5ad364f11dbae844a05ff63d91c9c9deb4faa1f3d"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2022-10-09.diff"
        sha256 "58d89c1d767b8915171bbc8f0fa04b026ba67dc5750d2b4d78acf2160d5425bd"
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
