class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2017-11-17.tar.gz"
  version "2017-11-17"
  sha256 "33137ce3085e9717c4ad3618b9471d9ccc149260647c04a24b65f27ea5319c9a"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end
end
