class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2018-12-23.tar.gz"
  version "2018-12-23"
  sha256 "2b7450902a233da53f10dbc80036d79541e3103661924f44dc427c4133de8a6e"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2018-12-23.diff"
        sha256 "5d064f20fd02ff63dcaddac6ba0acc84ea31f46ed202ff7f025023d3e14ca115"
      end
      bin.install "libmovim"
    end
    bin.install "openmovim"
    man1.install "openmovim.1"
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
