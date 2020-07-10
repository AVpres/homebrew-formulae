class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 & PowerPC-based Apple computers & clones"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2020-07-11.tar.gz"
  sha256 "144f221af59e578ce20bf73460d6b1748196b741319806b1cf0af43f73ff9427"

  option "with-debugger", "Install 6502, 680x0 and PowerPC debuggers"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples-2020-07-11.diff"
          sha256 "a09cf0cb3acde2602c3dffd03a8569db332438b67e17ddd29efbca6ecbd361c3"
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
