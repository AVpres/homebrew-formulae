# typed: true
# frozen_string_literal: true

# encode, decode, play and analyse moving images
class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2024-03-23.tar.gz"
  sha256 "358c7d7fbe1e34358421fb83a4b0a67a079e1991bd5c93a5310b1688fca9bdc3"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2024-03-23.diff"
        sha256 "5397e027cfd895ecb785111fcd3d889f58aff07ce80b7f35abf8c240a40cb993"
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
