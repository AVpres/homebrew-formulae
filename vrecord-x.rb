class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2022-01-10.tar.gz"
  version "2022-01-10"
  sha256 "76a49c6af208493385013f15b7694395a6be28e5fe1ee02ea25bbd64ba076dcd"

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
        url "https://avpres.net/patch/vrecord_2022-01-10_x_2022-01-13.diff"
        sha256 "f91c49f14b041857a7fcee43f0b4d6f6fd512c3656c3d981f292d1c697c4dc45"
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
