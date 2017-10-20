class Openycocg < Formula
  desc "An experimental video codec, built on the YCoCg colour space, designed for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2017-10-21.tar.gz"
  version "2017-10-21"
  sha256 "70d9b65b9f597d2be7d9b28e7fb4a9ee344c7ebcb9548561b848aa3376d19d3c"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end
end
