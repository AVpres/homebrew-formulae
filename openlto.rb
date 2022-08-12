class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2022-08-13.tar.gz"
  sha256 "76d698776edc1947bf8a399ef94d0d6e4ac9198c70c8e260a891d696db452a82"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2022-08-13.diff"
        sha256 "b7dc3195122a9963c3eff52218b7b9a678240dc6f3a35bbf2874396506f943af"
      end
      system "./configure"
      system "make"
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
