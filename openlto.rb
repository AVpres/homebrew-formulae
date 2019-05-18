class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2019-05-18.tar.gz"
  version "2019-05-18"
  sha256 "1ea1a6b08d43c2425c51021a95ba0d5a06b6244f953958ea62061dce2d60a353"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Sorry, the Terminal commands cannot be installed. Please login."
      else
        patch do
          url "https://avpres.net/patch/openlto_2019-05-18.diff"
          sha256 "9234f1af70bafef266fd3b30b31c27e9ec363658018a73562f0404de54e79897"
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
