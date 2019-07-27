class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2019-07-22.tar.gz"
  version "2019-07-22"
  sha256 "534e9daff42c95e300969e840b278a91ada3db739220bf67bd989834298bd11c"

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
        url "https://avpres.net/patch/vrecord_2019-07-22_x_2019-07-27.diff"
        sha256 "d92eafc2d5be8de038a91b011b463f49c3e70e1cf61f8374c0afcdcda96b1cb1"
      end
    end
    bin.install "vrecord"
    prefix.install "Resources/qcview.lua"
    prefix.install "Resources/vrecord_policy_ffv1.xml"
    prefix.install "Resources/vrecord_policy_uncompressed.xml"
    prefix.install "Resources/vrecord logo.png"
    prefix.install "Resources/vrecord logo playback.png"
    prefix.install "Resources/vrecord logo audio.png"
    prefix.install "Resources/vrecord logo edit.png"
    prefix.install "Resources/vrecord logo help.png"
    prefix.install "Resources/vrecord logo documentation.png"
    bin.install "vtest" if build.with? "vtest"
    man1.install "vrecord.1"
    man1.install "vtest.1" if build.with? "vtest"
  end

  test do
    system "#{bin}/vrecord", "-h"
    system "#{bin}/vtest", "-h" if build.with? "vtest"
  end
end
