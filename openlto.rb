class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://github.com/AVpres/openLTO/archive/2017-09-17.tar.gz"
  version "2017-09-17"
  sha256 "1ace8a3f9771c535c831746102672c2ebd61b35b5d3276d73ab3e655a0925b27"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    bin.install "openlto"
    man1.install "openlto.1"
  end
end
