class VrecordX < Formula
  desc "Vrecord flavour running on Linux (incl. as a Windows' app) and macOS"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2018-08-12.tar.gz"
  version "2018-08-25_x"
  sha256 "1c7eb50adcfdb84c847fc4f8f888fb82efa7a9bea69b7d3efe9ec83f31fd83c0"

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
  depends_on "xmlstarlet"

  conflicts_with "amiaopensource/amiaos/vrecord",
    :because => "both install approximately the same resources"

  patch do
    url "https://avpres.net/patch/vrecord_2018-08-12_x_2018-08-25.diff"
    sha256 "9de0423b78b9974e9d56de44075875231cbc5a1727055bd79ec278b2c9627634"
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

  def post_install
    if `brew ls -1 gnuplot 2>/dev/null | head -n1`.empty?
      puts "Warning: gnuplot is not installed. You can install it by running:"
      puts "  brew install gnuplot --without-lua"
      puts "It gives extra quality control images along with your QCTools report."
    end
  end

  test do
    system "#{bin}/vrecord", "-h"
    system "#{bin}/vtest", "-h" if build.with? "vtest"
  end
end
