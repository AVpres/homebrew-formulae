class Openltfs < Formula
  desc "Open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2017-11-16.tar.gz"
  version "2017-11-16"
  sha256 "671f98463c881d8b8d46481780dd141f0e0c6ef1ad42c468268facb9243964c4"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end
end
