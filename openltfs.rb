class Openltfs < Formula
  desc "CLI for libltfs library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-06-16.tar.gz"
  version "2018-06-16"
  sha256 "5e6702882d96bdd2e602fe8356e569203d9592472bcba07939ffcbf39e99426a"

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
