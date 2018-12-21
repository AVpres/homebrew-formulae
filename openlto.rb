class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2018-12-22.tar.gz"
  version "2018-12-22"
  sha256 "d8b13066facbb57f956478501e4c6622494742615c69027a7b9ec3daaab84edb"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The Terminal functions cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openlto_2018-12-22.diff"
        sha256 "e98467d6a186df5588e739c068873c6b7c11515616d2fb9ab5830354657b99f0"
      end
      bin.install "copylto"
      bin.install "ejectlto"
      bin.install "formatlto"
      bin.install "indexlto"
      bin.install "listlto"
      bin.install "loadlto"
      bin.install "migratelto"
      bin.install "mountlto"
      bin.install "readlto"
      bin.install "recoverlto"
      bin.install "repairlto"
      bin.install "searchlto"
      bin.install "selectlto"
      bin.install "unmountlto"
      bin.install "verifylto"
      bin.install "writelto"
    end
    bin.install "openlto"
    man1.install "openlto.1"
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
