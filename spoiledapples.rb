class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2020-04-12.tar.gz"
  sha256 "4e39d616ec6a3bb3d28cae1e046f90641c302b8ea5a8af98c92272b08dddfbba"

  bottle :unneeded

  option "with-debugger", "Install 6502, 680x0 and PowerPC debuggers"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples-2020-04-12.diff"
          sha256 "1fe36f652d11cd1c571b63ce0a2a564fc4bd54ccd461789a8e525e77de970227"
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
