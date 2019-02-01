class Openycocg < Formula
  desc "CLI for 'libycocg' to encode, decode, play and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2019-02-02.tar.gz"
  version "2019-02-02"
  sha256 "b9372e15c7e4f99c57e56392efaadf8907e50289fe4864884c60f08d77ae49b9"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libycocg' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openycocg_2019-02-02.diff"
        sha256 "e837f9395d83cd2eeb6dee820d7a52755c3710c5dc6eb443ea096e715020d24a"
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
