class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2021-03-13.tar.gz"
  sha256 "d68eb4e9b36e21ea3414591d10899926fc3724d0386ba8fa57f24c29b4b019bf"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2021-03-13.diff"
        sha256 "af6fc844c7c24bb0bf6b998cb89eb0530329c485a34d681d8f65617076d53331"
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
