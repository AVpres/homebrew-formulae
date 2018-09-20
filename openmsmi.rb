class Openmsmi < Formula
  desc "CLI for 'libmsmi' to handle multispectral moving images"
  homepage "https://avpres.net/openMSMI/"
  url "https://avpres.net/openMSMI/releases/2018-09-22.tar.gz"
  version "2018-09-22"
  sha256 "94056107b6d5912f572176ea7e9574ed2f3a0ff7ed9b2a455fc0c14319c58f66"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libmsmi' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openmsmi_2018-09-22.diff"
        sha256 "b80af9c889b036261a225a4467bd620bc9f1b209b67ed5c4e71db89d13572cde"
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
