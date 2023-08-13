# typed: true
# frozen_string_literal: true

# vrecord flavour running on Linux, macOS and Windows
class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/refs/tags/v2023-08-07.tar.gz"
  sha256 "2572ea969a42de32499dc74c663878f73c2de34e2d3022c409008f057321d032"


  option "with-doc", "Install the documentation locally"
  option "with-vtest", "Test streams from computer out to monitor through Blackmagic card"

  depends_on "pandoc" => :build

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink"
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

  conflicts_with "amiaopensource/amiaos/vrecord", because: "both install the same resources"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Sorry, cannot patch the original 'vrecord'. Please login."
      prefix.install "Resources/audio_mode.gif"
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
        url "https://avpres.net/patch/vrecord_2023-08-07_x_2023-08-13.diff"
        sha256 "1d99994edbe14a7cb49ac9c2accce143b5db918295bd12e51335121228f164d1"
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
