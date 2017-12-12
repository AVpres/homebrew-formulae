class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2017-12-12.tar.gz"
  version "2017-12-12"
  sha256 "a72bdb35f23d68ef620b1b9997466fcdca88d3657805586416a58588628fd779"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end
end
