class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://github.com/AVpres/openLTO/archive/2017-09-18.tar.gz"
  version "2017-09-18"
  sha256 "9a76f3ceb40fc18093135bba067666a60f86cde3efecd22ddf3056768a572b51"
  revision 1

  bottle :unneeded

  conflicts_with "ltopers",
    :because => "both install some scripts having the same name"

  def install
    man1.install "openlto.1"
  end
end
