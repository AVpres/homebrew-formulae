class Openycocg < Formula
  desc "CLI for libycocg library to encode, decode and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-06-23.tar.gz"
  version "2018-06-23"
  sha256 "b2d7c9a60798ca1594f02bdf636ad3dc5702306c212cc4bea8207d5dafd5b8dc"

  bottle :unneeded

  def install
    system "make"
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
