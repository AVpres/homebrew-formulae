class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-03-09.tar.gz"
  version "2019-03-09"
  sha256 "012b1a59e985d2e94e865b821e3c0d45efb7a834e2077d69ce836f5f6843002b"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-03-09.diff"
        sha256 "61468d7f9ca3e58a90eac7d8223ca8d6542e47316b394bb29fa69468028561aa"
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
