class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-05-25.tar.gz"
  version "2019-05-25"
  sha256 "fba93c87d3cd2b3f7606d8ca643aa293214f12ee6c59ea8c9f7f388a609c38d2"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Please login for a full installation."
      else
        patch do
          url "https://avpres.net/patch/spoiledapples_2019-05-25.diff"
          sha256 "4a1ee6bfe588efcaaaab82c00f28abddaa24f71d7c72e5693873a79540bbeadb"
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
