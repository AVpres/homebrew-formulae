class Openycocg < Formula
  desc "CLI for libycocg library to encode, decode and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-06-16.tar.gz"
  version "2018-06-16"
  sha256 "9b22cb74e96ca04eb7f2ff0042ff804fd032699a1d2766afea948a4d0b33d7e3"

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
