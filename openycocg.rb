class Openycocg < Formula
  desc "CLI for libycocg library to encode, decode and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-07-07.tar.gz"
  version "2018-07-07"
  sha256 "1bfe71d22c3050e639666f960054bfd427dd2ef59631a4f4575e4f300a36bef4"

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
