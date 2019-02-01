class Openmsmi < Formula
  desc "CLI for 'libmsmi' to handle multispectral moving images"
  homepage "https://avpres.net/openMSMI/"
  url "https://avpres.net/openMSMI/releases/2019-02-02.tar.gz"
  version "2019-02-02"
  sha256 "65cb9a38840857c7277d210ee8cb5efa85467f428e3c5bbb03a2a2881a7ffe2a"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmsmi' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmsmi_2019-02-02.diff"
        sha256 "c2cf55efd67b22b63e8567c0d2878deae87e928be37021a800b9ce490d1d6df5"
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
