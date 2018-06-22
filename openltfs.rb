class Openltfs < Formula
  desc "CLI for libltfs library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-06-23.tar.gz"
  version "2018-06-23"
  sha256 "ac97e13251bbaadc358ebf5c419c839562f38d3e9b2f20fb2091d8722e651276"

  bottle :unneeded

  def install
    system "make"
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-h"
  end
end
