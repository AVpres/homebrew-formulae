class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2019-06-15.tar.gz"
  version "2019-06-15"
  sha256 "146b2247376bff1b8ced814808783fddedd9bd2a43057a6c97545adbd3b298b0"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openlto_2019-06-15.diff"
          sha256 "4bbb068a824d722ac756aa6a17d8ccde75825d072b50bc0848cd274564953f3c"
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
    cd "doc" do
      man1.install "openlto.1"
    end
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
