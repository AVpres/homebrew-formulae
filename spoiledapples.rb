class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 & PowerPC-based Apple computers & clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2020-07-18.tar.gz"
  sha256 "d31ae664681360e0ba99d8fb075251533d5584fd5c2935dccfa836d14b2054f8"
  license "BSD-3-Clause"

  option "with-6502", "Enable 6502 assembly language support"
  option "with-680x0", "Enable 680x0 assembly language support"
  option "with-ppc", "Enable PowerPC assembly language support"
  option "with-z80", "Enable Z80 assembly language support"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples-2020-07-18.diff"
          sha256 "626d0ebe4452a22193e4348091c3b5e026b1aec9f1d4de28177ff4aa0bef829a"
        end

        args << "--enable-6502" if build.with? "6502"
        args << "--enable-680x0" if build.with? "680x0"
        args << "--enable-ppc" if build.with? "ppc"
        args << "--enable-z80" if build.with? "z80"

        system "./configure", *args
        system "make"
        system "make", "install"
      end
      bin.install "spoiledapples"
    end
    cd "man" do
      man1.install "spoiledapples.1"
    end
  end

  test do
    system "#{bin}/spoiledapples", "-h"
  end
end
