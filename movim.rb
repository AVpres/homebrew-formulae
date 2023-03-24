# typed: false
# frozen_string_literal: true

# encode, decode, play and analyse moving images
class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2023-03-25.tar.gz"
  sha256 "748ab23027fce8b8e8ff8b903aceffeef7139cff37c0724eee4bd9e48105b52a"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2023-03-25.diff"
        sha256 "9b48cad7fb975c2e39c5051050018772659c2848e9d8b45d88eb152d95b1dbf5"
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
