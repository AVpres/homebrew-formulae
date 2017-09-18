class Openltfs < Formula
  desc "An open and neutral LTFS, without the vendors' extensions"
  homepage "https://avpres.net/openLTFS/"
  url "https://github.com/AVpres/openLTFS/archive/openLTFS-2017-09-18.tar.gz"
  version "2017-09-18"
  sha256 "3cb45367a354fa0f96fef9379114ee0dea6c568c895feacc651d426467e7ca1f"

  bottle :unneeded

  def install
    man1.install "openltfs.1"
  end
end
