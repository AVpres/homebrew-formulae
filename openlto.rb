class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://github.com/AVpres/openLTO/archive/2017-12-12.tar.gz"
  version "2017-12-12"
  sha256 "3603702e7e5640c8a3149801de62ac4c5aa586c16c76217106b0163a62905adc"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    bin.install "openlto"
    man1.install "openlto.1"
  end
end
