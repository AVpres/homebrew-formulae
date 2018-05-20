class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2018-05-20.tar.gz"
  version "2018-05-20"
  sha256 "fe971c8a7c9cee43ef7331aedcdcf5b0c082cd645dadd5c71215f82076265700"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
