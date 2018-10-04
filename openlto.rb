class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2018-10-06.tar.gz"
  version "2018-10-06"
  sha256 "98dea2b939bc3d1c3257a7ded680388a212cd1e772636ba607ee05fe69cf780c"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The Terminal functions cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openlto_2018-10-06.diff"
        sha256 "41f629f5a7699d154b8985cd9c41b3e251aa8cc8a64308c65c084ae0b5bd546a"
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
