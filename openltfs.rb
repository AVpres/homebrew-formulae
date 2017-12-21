class Openltfs < Formula
  desc "Open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2017-12-21.tar.gz"
  version "2017-12-21"
  sha256 "a2947aa355569e1aed2d9f0917d621a083ee242c70b621baa209b931ba42809c"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
