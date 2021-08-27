class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2021-08-28.tar.gz"
  sha256 "f5cb437e0c5e5f6aaebb0f2e45fc88bd99054f1a508dd4a65f194b1a1df92b9b"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2021-08-28.diff"
        sha256 "9f64a0e961e28b179cbd3c73c9f31941f537ccc8e9388972dfb2b68325ebd7cb"
      end
      system "./configure"
      system "make"
    end
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/spoiledapples", "-h"
  end
end
