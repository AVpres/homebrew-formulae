# typed: true
# frozen_string_literal: true

# emulate 6502, 680x0 and PowerPC-based Apple computers and clones
class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2024-11-30.tar.gz"
  sha256 "bade4f66b941868b149d8ac9e56727686a9e1eba76685a94131e06c85e928c85"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2024-11-30.diff"
        sha256 "555590a436ebde17724f1183cacbc923f88d71b4b010546c9e58768a30e87e08"
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
