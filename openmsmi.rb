class Openmsmi < Formula
  desc "CLI for 'libmsmi' to handle multispectral moving images"
  homepage "https://avpres.net/openMSMI/"
  url "https://avpres.net/openMSMI/releases/2018-11-17.tar.gz"
  version "2018-11-17"
  sha256 "d7a533a9de3e05d06e9317351923c3a18d2e0543ca6bf533fd8399f61dff1a0f"

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
