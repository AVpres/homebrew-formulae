class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2019-09-07.tar.gz"
  sha256 "e91edf00da892962281f45a7b6a8cc878acf6fc07583df65498fdf8bef4d2088"

  bottle :unneeded

  option "with-debugger", "Install 6502, 680x0 and PowerPC debuggers"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples-2019-09-07.diff"
          sha256 "15648c73370d9e2a9b6e16602d639a29e3544a4769405211114bf4e2e442f4f9"
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
