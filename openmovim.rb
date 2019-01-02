class Openmovim < Formula
  desc "CLI for 'libmovim' to encode, decode, play and analyse moving images"
  homepage "https://avpres.net/openMovIm/"
  url "https://avpres.net/openMovIm/releases/2019-01-02.tar.gz"
  version "2019-01-02"
  sha256 "4e8ff3f37c8238605a3b527b1d2c5044efc35d5d0f1e0d4e59f915fd778d35bd"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmovim' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmovim_2019-01-02.diff"
        sha256 "16a27fae3b2f474ee20bc1de4db3030f638d09be07b2d18e1db5be32eff3bb34"
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
