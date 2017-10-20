class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://github.com/AVpres/openLTO/archive/2017-09-20.tar.gz"
  version "2017-09-20"
  sha256 "125192bf12876a653db12c5cc5ff13cc4049af794eb4387ac1d654542fe81627"
  revision 1

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    bin.install "openlto"
    man1.install "openlto.1"
  end
end
