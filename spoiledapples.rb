class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-02-10.tar.gz"
  version "2019-02-10"
  sha256 "c82b8c19935480746af0e395ac2137601b306e95fdaf619eb588f9ef31e9dae0"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The libraries cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples_2019-02-10.diff"
        sha256 "dfb0c30753dc76c5678095f3fb7d4a34540f80552ad50c825598f726f5b8e3d4"
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
