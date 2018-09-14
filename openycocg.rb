class Openycocg < Formula
  desc "CLI for 'libycocg' to encode, decode, play and analyse YCoCg video"
  homepage "https://avpres.net/openYCoCg/"
  url "https://avpres.net/openYCoCg/releases/2018-09-15.tar.gz"
  version "2018-09-15"
  sha256 "84431ad010b50337b34a814f072e6024e91cf2d07d49c92d03bcbb824ca6c53d"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`.empty?
      patch do
        url "https://avpres.net/patch/openycocg_2018-09-15.diff"
        sha256 "ffd41a4827c1ee80189083bd25473ea6872a094f520021aade98d311394ead4d"
      end
      bin.install "libycocg"
    else
      opoo "The 'libycocg' library cannot be installed. Please login."
    end
    bin.install "openycocg"
    man1.install "openycocg.1"
  end

  test do
    system "#{bin}/openycocg", "-h"
  end
end
