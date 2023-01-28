# typed: false
# frozen_string_literal: true

# emulate 6502, 680x0 and PowerPC-based Apple computers and clones
class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2023-01-28.tar.gz"
  sha256 "25c3829e858f192866efe0725c6cebde9fa39e098d3b4c5c3148273edc6e9d3c"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2023-01-28.diff"
        sha256 "a0cb66a5816974a04a44d1e5ecf4a1ddf05d5f43a97092b43eb6473fc80dae33"
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
