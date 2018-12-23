class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2018-12-24.tar.gz"
  version "2018-12-24"
  sha256 "a2b98da16ccba474a7280ada786b56da2b8f24892949d44d8ae2a9d1df8c5d11"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2018-12-24.diff"
        sha256 "61574906abe50dc41bc3b589da9bad97293f728d9120ab704552e8305bd907b9"
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
