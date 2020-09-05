class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2020-09-05.tar.gz"
  sha256 "26e493afad2d440cd2aaadda985081d400bf2781c275f74c9fddfe5a925852b3"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2020-09-05.diff"
        sha256 "713e21768468d724096055754dc1ac51d893cc8f39dde8cd7b051288bce5dc45"
      end
    end
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
