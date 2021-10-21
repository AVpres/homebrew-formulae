class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2021-10-23.tar.gz"
  sha256 "5d370b6ed042622c148477324589c5095f1fc83d7c5c52e1de62eabe50e607fd"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2021-10-23.diff"
        sha256 "ea82cdefbd10b1b13cc2eb557079d31cf3a8bc97fc1367098cc66db30449fabe"
      end
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
