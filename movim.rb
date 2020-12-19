class Movim < Formula
  desc "Encode, decode, play and analyse moving images"
  homepage "https://avpres.net/MovIm/"
  url "https://avpres.net/releases/movim-2020-12-19.tar.gz"
  sha256 "c9304fade3cdfccaf571df203c7f7fa0a53c195394cbe665a57519868c37d5f3"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/movim-2020-12-19.diff"
        sha256 "ae0c18932f5c8f327e6936e1d8df5ea357c550d8c69f6291972e5d64ac4ae539"
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
