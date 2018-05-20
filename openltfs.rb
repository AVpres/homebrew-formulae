class Openltfs < Formula
  desc "Open and neutral LTFS, without any vendors' extension"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2018-05-20.tar.gz"
  version "2018-05-20"
  sha256 "e8a16872c870b9284bced5f1244e7b296e48909d3307a926b78959d2dc078f0f"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
