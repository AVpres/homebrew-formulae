class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2019-12-21.tar.gz"
  sha256 "7dd678ccff9e6c1776a79fb677bee10d3f9778a674e83099fe35cc4a953dd205"

  bottle :unneeded

  option "with-debugger", "Install 6502, 680x0 and PowerPC debuggers"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples-2019-12-21.diff"
          sha256 "87c515cfe4f720b99256fcb6038e2295ca306bc37c8195548a0110bff6564cc1"
        end

        args << "--enable-debugger" if build.with? "debugger"

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
