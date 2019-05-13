class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-05-11.tar.gz"
  version "2019-05-11"
  sha256 "e5653cc64db675a245d01c8bce0583d01c473322e9b116438709434fb160f4fe"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "Sorry, the libraries cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples_2019-05-11.diff"
        sha256 "62518a1d67cd219f2a54100e502684ca7aa0dd82f0c4b189146c765f8a8f94be"
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
