class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2020-01-27.tar.gz"
  version "2020-01-27"
  sha256 "d1fa8a0d887cdf6a789cc41222b9f0bb6b63a16ad206eb15f10aef5077dc3aa0"

  bottle :unneeded

  option "with-doc", "Install the documentation"
  option "with-vtest", "Test streams from computer out to monitor through Blackmagic card"

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink"
  depends_on "amiaopensource/amiaos/gtkdialog"
  depends_on "cowsay"
  depends_on "freetype"
  depends_on "gnuplot"
  depends_on "mediaconch"
  depends_on "mkvtoolnix"
  depends_on "mpv"
  depends_on "qcli"
  depends_on "sdl"
  depends_on "xmlstarlet"

  conflicts_with "amiaopensource/amiaos/vrecord",
    :because => "both install approximately the same resources"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Sorry, cannot patch the original 'vrecord'. Please login."
    else
      patch do
        url "https://avpres.net/patch/vrecord_2020-01-27_x_2020-02-01.diff"
        sha256 "02185ab421bb696d2b52399e224c5f4227c2ae2683680b36f265ca9dcbee5794"
      end
    end
    bin.install "vrecord"
    prefix.install "Resources/qcview.lua"
    prefix.install "Resources/vrecord_policy_ffv1.xml"
    prefix.install "Resources/vrecord_policy_uncompressed.xml"
    prefix.install "Resources/vrecord_logo.png"
    prefix.install "Resources/vrecord_logo_playback.png"
    prefix.install "Resources/vrecord_logo_audio.png"
    prefix.install "Resources/vrecord_logo_edit.png"
    prefix.install "Resources/vrecord_logo_help.png"
    prefix.install "Resources/vrecord_logo_documentation.png"
    bin.install "vtest" if build.with? "vtest"
    man1.install "vrecord.1"
    man1.install "vtest.1" if build.with? "vtest"
  end

  test do
    system "#{bin}/vrecord", "-h"
    system "#{bin}/vtest", "-h" if build.with? "vtest"
  end
end
