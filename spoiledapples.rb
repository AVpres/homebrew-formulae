# typed: false
# frozen_string_literal: true

# emulate 6502, 680x0 and PowerPC-based Apple computers and clones
class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2023-03-25.tar.gz"
  sha256 "d3ef2f2463efa9902f19220f245d7d70c1b3933a05804f65e1e3a4dcb59fd6d1"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2023-03-25.diff"
        sha256 "b11dbb6242b5aabb2533dae4b646582f38cea33beb74d1fcbf297d6b5b11caa2"
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
