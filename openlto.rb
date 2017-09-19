class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://github.com/AVpres/openLTO/archive/2017-09-19.tar.gz"
  version "2017-09-19"
  sha256 "c18a7934bb00ac6c094ee67898ad5800221fac9287a76f09d8962d4eae5425f5"

  bottle :unneeded

  conflicts_with "ltopers",
    :because => "both install some scripts having the same name"

  def install
    man1.install "openlto.1"
  end
end
