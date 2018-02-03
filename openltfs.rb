class Openltfs < Formula
  desc "Open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2018-02-03.tar.gz"
  version "2018-02-03"
  sha256 "5438541f524397c400bbf2f8d9a8bf9a8883d7164d7eb550839c79e96207be99"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
