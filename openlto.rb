class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2018-09-22.tar.gz"
  version "2018-09-22"
  sha256 "45c76202c71feb43f11148a49d2eb6cc5ba6f57b54ace11a26d89bfd6b9a8583"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The Terminal functions cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openlto_2018-09-22.diff"
        sha256 "0a39244d9e520023fc1cd7c502b5576567eb159da567b643fd548f193203ebad"
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
