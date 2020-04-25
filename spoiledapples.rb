class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2020-04-25.tar.gz"
  sha256 "4b57bfb8b8a97b237ba136a1a1b91ccd305c0ccecd60273505e7bd3d297dfcb9"

  bottle :unneeded

  option "with-debugger", "Install 6502, 680x0 and PowerPC debuggers"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples-2020-04-25.diff"
          sha256 "cc50fda79416555ec453ff9f53988bb723aee4a0cb71d2cb49a5d85dffc093bf"
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
