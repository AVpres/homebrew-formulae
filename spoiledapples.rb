class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-02-16.tar.gz"
  version "2019-02-16"
  sha256 "e9bb9705176f1a0a674a1e250fb502574241a6112bd2c4854aa53aeed9247802"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The libraries cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples_2019-02-16.diff"
        sha256 "0bb541e199318cd89989c0abe3b0c06114759c3ede9cc2107f12a5ae538835f6"
      end
      mkdir "sa" do
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
