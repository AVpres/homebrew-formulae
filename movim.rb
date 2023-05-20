# typed: true
# frozen_string_literal: true

# encode, decode, play and analyse moving images
class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2023-05-20.tar.gz"
  sha256 "798490663d108d4072de9b0471802e0b148cc85d9084cea9cc310a6a55071b89"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2023-05-20.diff"
        sha256 "8b2cfb2dc18a75a48c486633b16c4b5d26fc27be2c60befa7c531922249c321d"
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
