class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2017-12-26.tar.gz"
  version "2017-12-26"
  sha256 "f2e91d3368a7d0b90e4111e89ae76ea9d087617665de51eb556e99bbb87edac0"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
