class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2021-12-18.tar.gz"
  sha256 "1513814a4ce88d3fca1188a1ed34dd30efefaeed1df6d60ce022804f24dc9387"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2021-12-18.diff"
        sha256 "b0e4d7d1b90358d49e246fa3c70967ad8df0946db57e3177268babc1456b9a52"
      end
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
