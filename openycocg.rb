class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2017-11-15.tar.gz"
  version "2017-11-15"
  sha256 "39930bcaa57acdd84afe4e90f620404e3ad3b945b66f5f1d9c01f01bb89181e6"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end
end
