class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-03-09.tar.gz"
  version "2019-03-09"
  sha256 "6bffb02830efd62be6c2f15c722252fe1d30e5ee454719b8509ff3a21f67b88b"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "Sorry, the libraries cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples_2019-03-09.diff"
        sha256 "35c841323b8330e1e398cf0dfca92b47be637370c82287cf39dfc361194a2a23"
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
