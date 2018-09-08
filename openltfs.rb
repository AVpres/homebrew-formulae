class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-09-08.tar.gz"
  version "2018-09-08"
  sha256 "0c8a7c8dd86e4fd175dd26b1f15263ef3d44c1c7e7907aba813f0c8c1dc294e8"

  bottle :unneeded

  def install
    system "make"
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
