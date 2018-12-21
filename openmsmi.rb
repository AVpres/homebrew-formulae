class Openmsmi < Formula
  desc "CLI for 'libmsmi' to handle multispectral moving images"
  homepage "https://avpres.net/openMSMI/"
  url "https://avpres.net/openMSMI/releases/2018-12-22.tar.gz"
  version "2018-12-22"
  sha256 "1f9a5bfc77aef58b64956fc14674787a49aedfe160c689f36642dc3b3ca8f7fa"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmsmi' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmsmi_2018-12-22.diff"
        sha256 "2058bc56a293a87239dcde205702f8ecdc21df4f38e18dcf9c817fe6714a73ef"
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
