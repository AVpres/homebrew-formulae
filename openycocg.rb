class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2017-12-19.tar.gz"
  version "2017-12-19"
  sha256 "5a8a12a394f77928e14149a363a17bf3ecdd3986977632e685a8337a7ba70a12"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
