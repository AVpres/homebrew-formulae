class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-07-21.tar.gz"
  version "2018-07-21"
  sha256 "6ad7bd75bb4819e65d7079d46b7dbd4daadce2b3aea7c13f7dc02901472926db"

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
