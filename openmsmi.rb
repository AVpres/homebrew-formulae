class Openmsmi < Formula
  desc "CLI for 'libmsmi' to handle multispectral moving images"
  homepage "https://avpres.net/openMSMI/"
  url "https://avpres.net/openMSMI/releases/2018-10-08.tar.gz"
  version "2018-10-08"
  sha256 "77b91603d5aa358737cf1e81561bd33bae136b7588e1daeb0ff7f87dbd0f6764"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmsmi' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmsmi_2018-10-08.diff"
        sha256 "0c860e0cbc9b2be3c3c57ce9870dd844828e5cd4b07dfdd7eb2d78396c7fc947"
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
