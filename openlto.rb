class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2019-07-06.tar.gz"
  version "2019-07-06"
  sha256 "ee67898261817f83ca920f2ca555f35cccb25af133d8beacde02868038c70653"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openlto_2019-07-06.diff"
          sha256 "ce44f01ee75059045e575b31748435afafa0e88a1ec11851f4dcbba4fe373ae5"
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
    end
    cd "man" do
      man1.install "dcp2lto.1"
      man1.install "lto2dcp.1"
      man1.install "openlto.1"
    end
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
