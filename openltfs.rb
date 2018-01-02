class Openltfs < Formula
  desc "Open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2018-01-03.tar.gz"
  version "2018-01-03"
  sha256 "4eccf99107619af3875e20aebfcc811065048d1e9fb2b0eacd8fcbe52ef13e34"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
