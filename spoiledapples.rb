class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-06-02.tar.gz"
  version "2019-06-02"
  sha256 "e3ee37c75384e8737613c554c0c5abef5fa8a855cdd0cbc3d4fb50c1ead52e36"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples_2019-06-02.diff"
          sha256 "16dd9df28eeea7ed2192c65127a71809324f7ec691a971e237776629d816d0a9"
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
