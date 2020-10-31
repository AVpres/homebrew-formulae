class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2020-10-31.tar.gz"
  sha256 "6c63ed11dd0bd675ba9cab7d69cc9459f46a13cb007e1c75e8c8ae53640e328e"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2020-10-31.diff"
        sha256 "fe7bcdc9d3473dc5015d592c6d2b8e8a3139f7ab10519b9c54f896e3234c4649"
      end
      system "./configure"
      system "make"
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
