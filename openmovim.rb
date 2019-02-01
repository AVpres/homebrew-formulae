class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-02-02.tar.gz"
  version "2019-02-02"
  sha256 "f03818595752e4b81902763de4ebc531a1b45ed7fe1a6a6d0336aba1011e1f9f"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-02-02.diff"
        sha256 "f97ee704d4b4dbce3bec379952188b6c52ecc0eddfa3b78105f3561746a020cd"
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
