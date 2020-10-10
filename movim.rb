class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2020-10-10.tar.gz"
  sha256 "20d391155e34a8a3f6adc79a811636412ff08c8aa581cc9130741e67d6d2ac14"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2020-10-10.diff"
        sha256 "681aa7c62b55fdc075e94f914feff0b15eca106330a9d2fccbccfb32b6070d6b"
      end
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
