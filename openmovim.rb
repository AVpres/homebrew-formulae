class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-01-26.tar.gz"
  version "2019-01-26"
  sha256 "94e219020d3008b36a8a905de898708127d3031e60f5cf1b5f8c1cddb9612d84"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-01-26.diff"
        sha256 "87319a0199650025857a96f9e01688668c5d2c1fca138e0f554883e25735becf"
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
