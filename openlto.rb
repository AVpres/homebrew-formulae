class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2020-04-05.tar.gz"
  sha256 "feb2d79c2070e85574969c8671c93c57baad4351234469ee83b26884d7e99548"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2020-04-05.diff"
        sha256 "617a094907290294c80dea0dc10c906688b90f01b3b4ded2c08beadba5423ac2"
      end
    end
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
