class Openycocg < Formula
  desc "CLI for 'libycocg' to encode, decode, play and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-09-01.tar.gz"
  version "2018-09-01"
  sha256 "fb9419b56a6852c376ff20f4b7dddab3059d307565bd4375a9f8ae97ad1fa8fc"

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
