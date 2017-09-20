class Openltfs < Formula
  desc "An open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/2017-09-20.tar.gz"
  version "2017-09-20"
  sha256 "773d089fc24da2ce25a6b091d6fa27f5af7e1a24c660fd5ede69616beef33df9"

  bottle :unneeded

  def install
    bin.install "openltfs"
    man1.install "openltfs.1"
  end
end
