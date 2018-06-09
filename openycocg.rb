class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-06-10.tar.gz"
  version "2018-06-10"
  sha256 "4b9ee9dad8fea7167d71d1530d22c58bd43fc5fab5f613bf23e1168e2b90360d"

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
