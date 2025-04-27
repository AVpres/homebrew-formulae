class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/refs/tags/v2024-10-18.tar.gz"
  sha256 "f2c0a3bc9ad36686f07d8fba7364f296be9253aac7e6dfcad0320b85da628517"

  option "with-doc", "Install the documentation locally"
  option "with-vtest", "Test streams from computer out to monitor through Blackmagic card"

  depends_on "pandoc" => :build

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/gtkdialog"
  depends_on "bash"
  depends_on "cowsay"
  depends_on "gnuplot"
  depends_on "mediaarea/mediaarea/dvrescue"
  depends_on "mediaconch"
  depends_on "mkvtoolnix"
  depends_on "mpv"
  depends_on "qcli"
  depends_on "xmlstarlet"

  conflicts_with "amiaopensource/amiaos/vrecord", because: "installs conflicting executables"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login.pl\n"
      opoo "Sorry, cannot patch the original 'vrecord'. Please login."
    else
      patch do
        url "https://avpres.net/patch/vrecord_2024-10-18_x_2024-10-26.diff"
        sha256 "8112172fdfa8bdd7243cabd113ab89b72bedb520fd7c34802d94453b62a40b5f"
      end
      args << "--with-doc" if build.with? "doc"
      args << "--with-vtest" if build.with? "vtest"
      system "./configure", *args
      system "make", "install"
    end
  end

  test do
    system bin/"vrecord", "-h"
    system bin/"vtest", "-h" if build.with? "vtest"
  end
end
