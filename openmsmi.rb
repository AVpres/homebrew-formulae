class Openmsmi < Formula
  desc "CLI for 'libmsmi' to handle multispectral moving images"
  homepage "https://avpres.net/openMSMI/"
  url "https://avpres.net/openMSMI/releases/2018-10-13.tar.gz"
  version "2018-10-13"
  sha256 "b162e214f788d0bca888e9dff35517a8c377c55ddfcab14422f180d3fd0074b1"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmsmi' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmsmi_2018-10-13.diff"
        sha256 "55d8a1d32252d2bd0ceeeb2dc51ea852d485282b395ac95d96c2564c4db359f0"
      end
      bin.install "libmsmi"
    end
    bin.install "openmsmi"
    man1.install "openmsmi.1"
  end

  test do
    system "#{bin}/openmsmi", "-h"
  end
end
