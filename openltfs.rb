class Openltfs < Formula
  desc "CLI for libltfs library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-06-30.tar.gz"
  version "2018-06-30"
  sha256 "5899b0a45ea00b4b639040b4a8b40c18dd5ea0ef1474df8cd74face326ed5380"

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
