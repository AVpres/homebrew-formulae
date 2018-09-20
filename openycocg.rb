class Openycocg < Formula
  desc "CLI for 'libycocg' to encode, decode, play and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-09-22.tar.gz"
  version "2018-09-22"
  sha256 "28f31ebc0b9099280030ae91c94bb0d4f3004ca8d16e61ca2b2209b3f40fa2a2"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libycocg' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openycocg_2018-09-22.diff"
        sha256 "f379398cc5977cdb3f1dcb542c7c95665df220f1a4fe09b1404ce1a3ad036200"
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
