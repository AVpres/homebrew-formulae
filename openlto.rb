class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/openLTO/"
  url "https://avpres.net/openLTO/releases/2019-02-16.tar.gz"
  version "2019-02-16"
  sha256 "90008fe3b352892a5c058abb34d587711f878131de6ca777624f779534e6e85e"

  bottle :unneeded

  conflicts_with "amiaopensource/amiaos/ltopers",
    :because => "both install some scripts having the same name"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The Terminal functions cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openlto_2019-02-16.diff"
        sha256 "f6c8be8dc8edb46cbef91ddfaf287f4d20f3bc0d302be55c733209c9d22a590e"
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
