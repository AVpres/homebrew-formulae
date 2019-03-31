class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-03-31.tar.gz"
  version "2019-03-31"
  sha256 "6cfdc3b47cf3357c58d7f4856aa6e18b4b45b73bf77af3d5e2a2b9c7855ce998"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "Sorry, the libraries cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples_2019-03-31.diff"
        sha256 "71289915f934782bbfc274940d85b992916057de003f3ac47fdee91a15cad00a"
      end
      args = %W[
        --prefix=#{prefix}
        --enable-debugger
      ]
      mkdir "sa" do
        system "./configure", *args
        system "make"
        system "make", "install"
      end
    end
    bin.install "spoiledapples"
    man1.install "spoiledapples.1"
  end

  test do
    system "#{bin}/spoiledapples", "-h"
  end
end
