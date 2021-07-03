class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2021-07-03.tar.gz"
  sha256 "ddbbce57e490ea307f8c12fbed34dbc9e5864dcece97202d70fa20a88c69c373"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2021-07-03.diff"
        sha256 "95d5ec7339fe3364f78ef21a9be53307d1daa704083f435a31b24762185d691d"
      end
      system "./configure"
      system "make"
    end
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
