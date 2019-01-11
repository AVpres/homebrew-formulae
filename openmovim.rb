class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-01-12.tar.gz"
  version "2019-01-12"
  sha256 "c1a9136a8c62659ab991abbf73d240f491fabfc2eaf78d6d11a696b28ed314d9"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-01-12.diff"
        sha256 "e94f52856248c97418c580ba535c30b1e4ada1df61077a5bb26eb193486f4221"
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
