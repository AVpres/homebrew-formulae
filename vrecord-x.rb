class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/refs/tags/vrecord_v2025-04-21.tar.gz"
  sha256 "019d24ddd4b2d5bb0d467d27d42382fa689af7ab3f65fbfe835fa11d84aead33"

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
        url "https://avpres.net/patch/vrecord_2025-04-21_x_2025-04-29.diff"
        sha256 "f5c3b7efd91af57f40ceeb82a1ac07f00777e0dd2a34207259f6f1d2163f4a60"
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
