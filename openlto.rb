class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://github.com/AVpres/openLTO/archive/2018-03-24.tar.gz"
  version "2018-03-24"
  sha256 "43c758fdc40fd11a54b8cdd9d059ef2047d067e93fa712e56b58fe42d39805d2"

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
