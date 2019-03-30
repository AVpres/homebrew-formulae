class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-03-09.tar.gz"
  version "2019-03-09"
  sha256 "306c1a4ed31f629d507ade079dac3dcde7bb47b8df69057ec9f136954ec440c3"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "Sorry, the libraries cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples_2019-03-30.diff"
        sha256 "3c7b05714461a2c5acd26d587de02d3cdc1a54c649889328aa27b6d8576f845d"
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
