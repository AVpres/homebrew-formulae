class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-01-05.tar.gz"
  version "2019-01-05"
  sha256 "c3abd3a1d01e75e12f6d26d25af0e8c1d3ab0c19c004aa1b1f4308ac21431640"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-01-05.diff"
        sha256 "6bed661d81966f8e252d665a06955e659bef51cd64df600512e47685b0a43771"
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
