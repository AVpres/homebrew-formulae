# typed: false
# frozen_string_literal: true

# emulate 6502, 680x0 and PowerPC-based Apple computers and clones
class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2022-12-03.tar.gz"
  sha256 "c86c2928f583e1226f2507e67422f4f9c2b6be691962aefbc91b77674530d9fb"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2022-12-03.diff"
        sha256 "3c0e69f3467f7945b4f7351c3671b9e5a85f42298af2207de2901e90998cbe51"
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
