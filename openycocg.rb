class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-06-09.tar.gz"
  version "2018-06-09"
  sha256 "5c671d8dc14fbbe88895357c714af95dfad67742ff938cfa21a16cd0de6fc844"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
