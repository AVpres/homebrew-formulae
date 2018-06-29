class Openycocg < Formula
  desc "CLI for libycocg library to encode, decode and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-06-30.tar.gz"
  version "2018-06-30"
  sha256 "143245349b298b45dc3ba910ead8cab775d914580eab3d187827a75e1322b471"

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
