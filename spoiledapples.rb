class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-03-09.tar.gz"
  version "2019-03-09"
  sha256 "306c1a4ed31f629d507ade079dac3dcde7bb47b8df69057ec9f136954ec440c3"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The libraries cannot be installed. Please login."
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
