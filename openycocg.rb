class Openycocg < Formula
  desc "Video codec, built on YCoCg colour space, for restoration purposes"
  homepage "https://avpres.net/openYCoCg/"
  url "https://github.com/AVpres/openYCoCg/archive/2018-02-03.tar.gz"
  version "2018-02-03"
  sha256 "1e15bbf7c2b33aa09df8071dadf3be4c91f0c010ae4f8d8ddf227e9cb2c1b303"

  bottle :unneeded

  def install
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
