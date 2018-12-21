class Openmovim < Formula
  desc "CLI for 'libycocg' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2018-12-22.tar.gz"
  version "2018-12-22"
  sha256 "c0f5c3869539e91ec638547cb1417588b489b4de56838a80a0d7f916d46fe138"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2018-12-22.diff"
        sha256 "5ac22e0664100a724fbc2cc4034873fffe1e260cba1061e3bda044fdd11dac25"
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
