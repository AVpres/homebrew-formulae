# typed: false
# frozen_string_literal: true

# encode, decode, play and analyse moving images
class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2023-01-28.tar.gz"
  sha256 "01ebff46adba67eec38b5ae1375b094b768498b41defe1c760a804e9ab596483"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2023-01-28.diff"
        sha256 "1bee1055ed686ea8365014c4984df4c721fa3710c23da18d6afebf81dfaf46f3"
      end
      system "./configure"
      system "make"
      lib.install Dir["lib/*"]
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openmovim", "-h"
  end
end
