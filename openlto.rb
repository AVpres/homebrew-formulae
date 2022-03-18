class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2022-03-19.tar.gz"
  sha256 "62eaa5f709503bdc82ee3a8f6410739986a91fe330765cb57c8358a005d7f355"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2022-03-19.diff"
        sha256 "936dc83cb6880bfd8e90ab963b9dce4ae6695eb560bd120505360131d8c2ce25"
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
