class Spoiledapples < Formula
  desc "Emulation of 6502, 680x0 and PowerPC-based Apple computers"
  homepage "https://avpres.net/Spoiled_Apples/"
  url "https://avpres.net/Spoiled_Apples/releases/2019-02-09.tar.gz"
  version "2019-02-09"
  sha256 "2c36cd2175d77481dbd6cdcc06b3464a2fcf832528a353a064992bfedb1adec5"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libspoiledapples' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/spoiledapples_2019-02-09.diff"
        sha256 "4ee2bff833301c3293471901e11b520e82cdefee445502c4f332e9aeef499459"
      end
      bin.install "libspoiledapples"
    end
    bin.install "spoiledapples"
    man1.install "spoiledapples.1"
  end

  test do
    system "#{bin}/spoiledapples", "-h"
  end
end
