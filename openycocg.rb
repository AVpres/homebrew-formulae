class Openycocg < Formula
  desc "CLI for 'libycocg' to encode, decode, play and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-07-21.tar.gz"
  version "2018-07-21"
  sha256 "458f43844ab66f9a1f0d825f72e815c5b73267f8a70161c32791ec0ecdec6bac"

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
