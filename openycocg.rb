class Openycocg < Formula
  desc "CLI for 'libycocg' to encode, decode, play and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-12-22.tar.gz"
  version "2018-12-22"
  sha256 "1aa77755838412d4cfbf9d506edc390f5e7933d48abadb9c238a4b00caaed004"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libycocg' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openycocg_2018-12-22.diff"
        sha256 "2b68706f4cac59c78d5b4dcd780f8e8771bdb01cefb28223f8b0f279b2892617"
      end
      bin.install "libycocg"
    end
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
