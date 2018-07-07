class Openltfs < Formula
  desc "CLI for libltfs library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-07-07.tar.gz"
  version "2018-07-07"
  sha256 "4714788c7cf89d6a272bb27e319890b593552c5e5f26312a8c59b75e3349ca2f"

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
