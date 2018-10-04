class Openmsmi < Formula
  desc "CLI for 'libmsmi' to handle multispectral moving images"
  homepage "https://avpres.net/openMSMI/"
  url "https://avpres.net/openMSMI/releases/2018-10-06.tar.gz"
  version "2018-10-06"
  sha256 "30b7c7098d39e3be9c7c0454f85b4ec32bc8cdac43a92a76ee7062168db5153c"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmsmi' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmsmi_2018-10-06.diff"
        sha256 "dd0ab0e9ad8b56124319d65ae7d986d089ebab46107fb548d3fa10a72abbf3c5"
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
