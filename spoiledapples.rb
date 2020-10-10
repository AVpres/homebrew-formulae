class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2020-10-10.tar.gz"
  sha256 "b1d0e1e5c13a1588e4fbd506e8f4d5fd1b75d99dbfbd12a434a3d8be0e4df4a9"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2020-10-10.diff"
        sha256 "38f75c3ee64913aa86e9704f392518b1784921220c52719d5c2758367eeb8813"
      end

      system "./configure", *args
      system "make"
      system "make", "install"
    end
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/spoiledapples", "-h"
  end
end
