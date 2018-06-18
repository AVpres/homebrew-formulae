class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2018-06-11.tar.gz"
  version "2018-06-11"
  sha256 "cba0ff013b9d555281e41234275525b191e85533797ab9a76b6020d35c220ed9"

  bottle :unneeded

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

  patch do
    url "https://avpres.net/patch/vrecord_2018-06-11.diff"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  end

  def install
    bin.install "vrecord"
    bin.install "qcview.lua"
    bin.install "vrecord_policy_ffv1.xml"
    bin.install "vrecord_policy_uncompressed.xml"
    bin.install "vtest" if build.with? "vtest"
    prefix.install "vrecord_logo.png"
    man1.install "vrecord.1"
    man1.install "vtest.1" if build.with? "vtest"
  end

  test do
    system "#{bin}/vrecord", "-h"
    system "#{bin}/vtest", "-h" if build.with? "vtest"
  end
end
