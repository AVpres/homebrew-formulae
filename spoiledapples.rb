# typed: true
# frozen_string_literal: true

# emulate 6502, 680x0 and PowerPC-based Apple computers and clones
class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2025-03-28.tar.gz"
  sha256 "b36aeea54d3e2f02604816f4379525930990b1cb94b09e47de77533f9dd48192"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2025-03-28.diff"
        sha256 "5ee7fa3762dd70e4dd46b8c239e838d396cb7679e0ae3de026b2988aa1213b01"
      end
      system "./configure"
      system "make"
      lib.install Dir["lib/*"]
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/spoiledapples", "-h"
  end
end
