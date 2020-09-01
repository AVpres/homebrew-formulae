class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2020-09-01.tar.gz"
  sha256 "eb23443cca52bf6a5268a6e042bbb48ad23480175ebb5cf88cd5c85d74515157"
  license "BSD-3-Clause"

  option "with-6502", "Enable 6502 assembly language support"
  option "with-680x0", "Enable 680x0 assembly language support"
  option "with-ppc", "Enable PowerPC assembly language support"
  option "with-z80", "Enable Z80 assembly language support"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples-2020-09-01.diff"
        sha256 "376bd45fe39f3510ed6f6ce332dc336c894ce8dcdfb1429603814c9d63117c7e"
      end

      args << "--enable-6502" if build.with? "6502"
      args << "--enable-680x0" if build.with? "680x0"
      args << "--enable-ppc" if build.with? "ppc"
      args << "--enable-z80" if build.with? "z80"

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
