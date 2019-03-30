class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-03-30.tar.gz"
  version "2019-03-30"
  sha256 "2c80e89370dbb1bf0681e58e94588f8134a8e526151ae2b3019fccccc4dc64c5"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "Sorry, the libraries cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples_2019-03-30.diff"
        sha256 "2bb9a8ac30c950ebdfb52462509dd8536636552b17e9a7dba5d1d1531bf60aec"
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
