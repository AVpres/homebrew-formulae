class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-06-15.tar.gz"
  version "2019-06-15"
  sha256 "1c86582fa82d79425ae956cf2d8599bc93420a024b7ecc15090ab17076fe3999"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples_2019-06-15.diff"
          sha256 "c4f1dac46aec322ef8c834b2f9b9a1efe8d1f6b3587f01d454554fa04f90102d"
        end
        args = %W[
          --prefix=#{prefix}
          --enable-debugger
        ]
        system "./configure", *args
        system "make"
        system "make", "install"
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
