class Openycocg < Formula
  desc "An experimental video codec, built on the Y′COCG colour space, designed for restoration purposes"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openYCoCg/archive/2017-10-20.tar.gz"
  version "2017-10-20"
  sha256 "9c64abb7884ac377acb25768100b7217de46c62942ec7a4a6a28b21373da4afc"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end
end
