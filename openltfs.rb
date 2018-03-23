class Openltfs < Formula
  desc "Open and neutral LTFS, without any vendors' extension"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2018-03-24.tar.gz"
  version "2018-03-24"
  sha256 "ed6273db8dbc0f4f6c7f4bd4d8e8bf9ba3ae512fa8b1ec8a16b154978bd4e178"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
