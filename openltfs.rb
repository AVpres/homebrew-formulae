class Openltfs < Formula
  desc "Open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2017-12-12.tar.gz"
  version "2017-12-12"
  sha256 "62d0d3f99d97c7fa08468ede2c987e926d94cf4114400991c5041b38757b75cc"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end
end
