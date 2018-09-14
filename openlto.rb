class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2018-09-15.tar.gz"
  version "2018-09-15"
  sha256 "cf96de01ef2ffe9c631e24fc19c197b579272e523b3ef6e581a06f4f9b3bce5e"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`.empty?
      patch do
        url "https://avpres.net/patch/openlto_2018-09-15.diff"
        sha256 "dd09b02aedddb43a4ab2f90325e5ecb8141bf35379555f8f46de4e39f9b4c436"
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
    else
      opoo "The Terminal functions cannot be installed. Please login."
    end
    bin.install "openlto"
    man1.install "openlto.1"
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
