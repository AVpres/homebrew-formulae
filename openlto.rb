class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2021-05-08.tar.gz"
  sha256 "d15a14fa24eea7a5b9e9cd96c5b7a6519e1284b265a854914292ebb1cac45663"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2021-05-08.diff"
        sha256 "c0d7fffa6b5fd23ede2398a88bb15fd2be86518555b7ec2170e083f5133cdaf4"
      end
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
