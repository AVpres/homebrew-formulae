class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2021-08-28.tar.gz"
  sha256 "328ca6dce0e46e7056c4bd5982910c4cf90a078a97d8ffd74e43c19fbe532940"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2021-08-28.diff"
        sha256 "7d5ed0d7cf0667a9faf431a2b84ac6f9d39db1837f5e540854c94de00a977b96"
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
