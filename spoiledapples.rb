class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/releases/spoiledapples-2020-01-25.tar.gz"
  sha256 "c19217f6cbd78d8ee5f1cfe1ca48bf522cae2c1d836d2bc666ef83bbd56f611f"

  bottle :unneeded

  option "with-debugger", "Install 6502, 680x0 and PowerPC debuggers"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples-2020-01-25.diff"
          sha256 "dc7157dca5eb1e0ea336abdf53865314275137a3b0445bb33c14afe22b0c487c"
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
