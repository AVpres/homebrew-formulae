class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2019-07-13.tar.gz"
  sha256 "21d0f2c4f28f8618a0e3c353eb2f65df366369d1124568044fee2078eafab239"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openlto-2019-07-13.diff"
          sha256 "f195b2e32affff340e6bf76b5c5b3c211451621e9b04beeb7c0af78b1acc7123"
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
