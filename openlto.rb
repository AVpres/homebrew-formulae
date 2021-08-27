class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2021-08-28.tar.gz"
  sha256 "5386b7ba46895cfd8cacee1e82883d220548375ce0fbfbb1c1358aec75a8800e"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2021-08-28.diff"
        sha256 "21080d34059d4f02c9c1198bc8caecdd95ab028c5573fc32661d805ccdf1f96f"
      end
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
