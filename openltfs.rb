class Openltfs < Formula
  desc "Open and neutral LTFS, without any vendors' extension"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-06-09.tar.gz"
  version "2018-06-09"
  sha256 "f8a590a9ce016fa5b10bd415bb58649c43e26df6027642776a0d5571dd7533d2"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
