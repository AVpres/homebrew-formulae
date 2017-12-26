class Openltfs < Formula
  desc "Open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2017-12-26.tar.gz"
  version "2017-12-26"
  sha256 "3f2911654174a11a69689c6dbb7f25c268c9019ba29fce88d3ecbe3fd5df5cf4"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
