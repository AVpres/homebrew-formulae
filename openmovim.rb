class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-01-01.tar.gz"
  version "2019-01-01"
  sha256 "71d40fe20fcaf25a87d1eeee0a395003c90e60916df8d8c2d8941210e68b42b1"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-01-01.diff"
        sha256 "aaaed814cbb4be8d875ed5b3cd211b7d45f129b29fe9071c762670d701b63a03"
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
