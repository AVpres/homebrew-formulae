class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2021-01-25.tar.gz"
  version "2021-01-25"
  sha256 "2e62563e71f98ca4eb33bb2989989c9ccdb8085fe1292eacf4c7efd9e4112589"
  revision 2

  option "with-doc", "Install the documentation"
  option "with-vtest", "Test streams from computer out to monitor through Blackmagic card"

  depends_on "pandoc" => :build

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink"
  depends_on "amiaopensource/amiaos/gtkdialog"
  depends_on "cowsay"
  depends_on "gnuplot"
  depends_on "mediaconch"
  depends_on "mkvtoolnix"
  depends_on "mpv"
  depends_on "qcli"
  depends_on "sdl"
  depends_on "xmlstarlet"

  conflicts_with "amiaopensource/amiaos/vrecord", because: "both install the same resources"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Sorry, cannot patch the original 'vrecord'. Please login."
      prefix.install "Resources/dvrecord.png"
      prefix.install "Resources/qcview.lua"
      prefix.install "Resources/vrecord_functions"
      prefix.install "Resources/vrecord_policy_ffv1.xml"
      prefix.install "Resources/vrecord_policy_uncompressed.xml"
      prefix.install "Resources/vrecord_logo.png"
      prefix.install "Resources/vrecord_logo_playback.png"
      prefix.install "Resources/vrecord_logo_audio.png"
      prefix.install "Resources/vrecord_logo_edit.png"
      prefix.install "Resources/vrecord_logo_help.png"
      prefix.install "Resources/vrecord_logo_documentation.png"
      bin.install "vrecord"
      bin.install "vtest" if build.with? "vtest"
      man1.install "vrecord.1"
      man1.install "vtest.1" if build.with? "vtest"
    else
      patch do
        url "https://avpres.net/patch/vrecord_2021-01-25_x_2021-05-08.diff"
        sha256 "be3968554d3b1158696823f7139fd3d851548ef6ec2d67045607381ec8941246"
      end
      args << "--with-doc" if build.with? "doc"
      args << "--with-vtest" if build.with? "vtest"
      system "./configure", *args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/vrecord", "-h"
    system "#{bin}/vtest", "-h" if build.with? "vtest"
  end
end
