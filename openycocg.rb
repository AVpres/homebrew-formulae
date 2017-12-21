class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2017-12-21.tar.gz"
  version "2017-12-21"
  sha256 "3c02a05fc3ba302301e28e85e0737cf82b54ad58b971219c3ba72ded3f2548da"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
