class Openycocg < Formula
  desc "CLI for libycocg library to encode, decode and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-07-08.tar.gz"
  version "2018-07-08"
  sha256 "cb4d5dc3e6cacfbae9c2d44602b99a333afc710d900ceaf90c8b464ba38b433d"

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
