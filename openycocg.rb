class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2018-03-24.tar.gz"
  version "2018-03-24"
  sha256 "b353bd420d5fb776a26949fb178b64802f9b39fbbfc026d40904f7d82c4b5913"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
