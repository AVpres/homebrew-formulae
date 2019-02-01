class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2019-02-02.tar.gz"
  version "2019-02-02"
  sha256 "f24700f79052447c446a0aef111fe483acf40035ac30af122588a37227fbc359"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The Terminal functions cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openlto_2019-02-02.diff"
        sha256 "2fb371766d67fe58ad9686bc00742aea0ea59933d8eb0e6be3fa4d710f047e7c"
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
