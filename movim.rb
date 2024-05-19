# typed: true
# frozen_string_literal: true

# encode, decode, play and analyse moving images
class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2024-05-18.tar.gz"
  sha256 "a3ce993e39ea8b8683d72802f75c3c30c587e009666e751679b8a552b443c9ed"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2024-05-18.diff"
        sha256 "07e856689aca1d4b16e7237dd4e67c5d3e3c66acf9c11ca984eab71b7365cbe2"
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
