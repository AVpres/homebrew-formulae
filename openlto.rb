class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://github.com/AVpres/openLTO/archive/2017-12-26.tar.gz"
  version "2017-12-26"
  sha256 "3f74a7881929bd48d1214c9f1643d591714159684d978e34f05d5355fb1006fa"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    bin.install "openlto"
    man1.install "openlto.1"
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
