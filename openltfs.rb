class Openltfs < Formula
  desc "An open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2017-09-19.tar.gz"
  version "2017-09-19"
  sha256 "657231f0959447c7731682016f051b60a076919c6b79cfebed63b3d746bb3d65"

  bottle :unneeded

  def install
    man1.install "openltfs.1"
  end
end
