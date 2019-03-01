class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-03-02.tar.gz"
  version "2019-03-02"
  sha256 "994222cb1b9b31fe63d0fcc0f6159ca90d767d5683777691cd0896bfebece5e1"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-03-02.diff"
        sha256 "a1e913ef16c6dd291293a33277456f80ee06f6c5fc1efe7e0397ad10ecf876ae"
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
