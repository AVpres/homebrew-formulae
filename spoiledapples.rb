class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-05-18.tar.gz"
  version "2019-05-18"
  sha256 "c163c4b2e94dae936088d9a92e0f15912a6b65fbd5d7cab80ac8bf33156363e7"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Sorry, the libraries cannot be installed. Please login."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples_2019-05-18.diff"
          sha256 "22eabe25d1173dbef459968f7004b3b64b2da112f23a473a78145061b721425a"
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
    end
    cd "doc" do
      man1.install "spoiledapples.1"
    end
  end

  test do
    system "#{bin}/spoiledapples", "-h"
  end
end
