# typed: true
# frozen_string_literal: true

# encode, decode, play and analyse moving images
class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2025-01-31.tar.gz"
  sha256 "c8af6afcedb7daafced7a0ae0f7089b123e575b902e5bc06478fa8a00ea0a6d5"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2025-01-31.diff"
        sha256 "a708a94a59f981df0b405543727f8662719ffff7ebda2f03ce94259c8149c39a"
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
