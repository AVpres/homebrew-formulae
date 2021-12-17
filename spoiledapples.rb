class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2021-12-18.tar.gz"
  sha256 "8ac14f50fd585f9270607396cc3f0c95fd2655c2b7b6d590ec4b592db4c5dc6b"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2021-12-18.diff"
        sha256 "1e3eaeff8ff600aab99d865c29f210b342b7d017daafbec2dcd14d5103c8f5a3"
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
