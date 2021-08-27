class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2021-08-18.tar.gz"
  version "2021-08-18"
  sha256 "efe7276d9f8c46d432580b5014b2d97bb2aa4e007d1760ba990c081f52c13b58"

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
        url "https://avpres.net/patch/vrecord_2021-08-18_x_2021-08-28.diff"
        sha256 "8714447b4e16da65ada33e0c1a1e03a8b90fcf747ede4559679829e1586e6dcf"
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
