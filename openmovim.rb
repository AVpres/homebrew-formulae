class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-01-19.tar.gz"
  version "2019-01-19"
  sha256 "01f867421fe26c618e52f4e2dc7fc0be8805b1f934e162c5a048c347748eedd4"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-01-19.diff"
        sha256 "462a529667828ba6208e1b3c20dd97e96025e65d8c5cc944c0f39245024f47b3"
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
