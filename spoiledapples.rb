class Spoiledapples < Formula
  desc "Emulate 6502, 680x0 and PowerPC-based Apple computers and clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2020-08-15.tar.gz"
  sha256 "25e642ca30fa24258b717987004f15d3c0ee128112c1a197e567f9d72cf78a67"
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
        url "https://avpres.net/patch/spoiledapples-2020-07-19.diff"
        sha256 "ecf71fbdd9cce23c64981c4c05d8861144a84235f516bc354e312bd4578aa746"
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
