class Openycocg < Formula
  desc "CLI for 'libycocg' to encode, decode, play and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-11-17.tar.gz"
  version "2018-11-17"
  sha256 "df876a532735c660bb77783a8a84d9d0845f49160a5a22e15680ab2658168bf9"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libycocg' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openycocg_2018-10-06.diff"
        sha256 "3ebd70b2081e2105405ac130739575426e6cd361328d713bd44058a31b85347e"
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
