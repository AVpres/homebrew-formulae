class VrecordX < Formula
  desc "Vrecord flavour running on Linux (incl. Windows Subsystem) and macOS"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2018-07-03.tar.gz"
  version "2018-07-03_x"
  sha256 "934cdeae9153e59d493968f114b898603ff8075558dde8388ecddd9f5c4fb24b"

  bottle :unneeded

  option "with-doc", "Install the documentation" #### TO-DO
  option "with-vtest", "Test streams from computer out to monitor through Blackmagic card"

  depends_on "cowsay"
  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink" => ["with-sdl2", "with-freetype", "with-openjpeg"]
  depends_on "freetype"
  depends_on "mediaconch"
  depends_on "mkvtoolnix"
  depends_on "mpv"
  depends_on "qcli"
  depends_on "sdl"

  depends_on "xmlstarlet" => :recommended

  conflicts_with "amiaopensource/amiaos/vrecord",
    :because => "both install approximately the same resources"

  patch do
    url "https://avpres.net/patch/vrecord_2018-07-03_x_2018-07-07.diff"
    sha256 "46b7f9db354dd68f74059ca5173ff42120e69991452cea19d23ec2ed6fc57199"
  end

  def install
    bin.install "vrecord"
    bin.install "qcview.lua"
    bin.install "vrecord_policy_ffv1.xml"
    bin.install "vrecord_policy_uncompressed.xml"
    bin.install "vtest" if build.with? "vtest"
    man1.install "vrecord.1"
    man1.install "vtest.1" if build.with? "vtest"
  end

  test do
    system "#{bin}/vrecord", "-h"
    system "#{bin}/vtest", "-h" if build.with? "vtest"
  end
end
