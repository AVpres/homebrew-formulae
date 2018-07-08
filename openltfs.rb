class Openltfs < Formula
  desc "CLI for libltfs library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-07-08.tar.gz"
  version "2018-07-08"
  sha256 "f105592cc591e35670301de598a7b775500f1126108b37617eda370063a8295d"

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
