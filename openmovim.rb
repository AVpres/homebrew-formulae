class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-03-16.tar.gz"
  version "2019-03-16"
  sha256 "6ff9aeb8e9a9cc5e94729c4ee41950f00fd1ec440f6a1b36c30fa88adb4e0350"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-03-16.diff"
        sha256 "7dab486270e3009c7cdb5ed6f1f927041367997551f201b24854b5aa4429a6b4"
      end
      bin.install "libmovim"
      bin.install "movimenc"
      bin.install "movimdec"
      bin.install "movimplay"
    end
    bin.install "openmovim"
    man1.install "openmovim.1"
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
