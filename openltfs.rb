class Openltfs < Formula
  desc "Open and neutral LTFS, without any vendors' extension"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-06-10.tar.gz"
  version "2018-06-10"
  sha256 "443a5af5fe03809ae71aa6f88a4f06fb321e787054a61c01a1dfda0471a9efde"

  bottle :unneeded

  def install
    system "make"
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
