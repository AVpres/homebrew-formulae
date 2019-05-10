class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-05-11.tar.gz"
  version "2019-05-11"
  sha256 "feaccb225474e2bbc20aafb7fd4b864916c6a462efe1dddcbe7c29022821899c"

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
