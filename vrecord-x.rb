class VrecordX < Formula
  desc "Vrecord flavour running on Linux (incl. as a Windows' app) and macOS"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2019-01-19.tar.gz"
  version "2019-01-19_x"
  sha256 "4defe59a2f547c6975240b2b1c43951f1fe9807cc5cf5320e956c7ede56cf7fd"

  bottle :unneeded

  option "with-doc", "Install the documentation" #### TO-DO
  option "with-vtest", "Test streams from computer out to monitor through Blackmagic card"

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink"
  depends_on "amiaopensource/amiaos/gtkdialog"
  depends_on "cowsay"
  depends_on "freetype"
  depends_on "mediaconch"
  depends_on "mkvtoolnix"
  depends_on "mpv"
  depends_on "qcli"
  depends_on "sdl"
  depends_on "xmlstarlet"

  conflicts_with "amiaopensource/amiaos/vrecord",
    :because => "both install approximately the same resources"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      odie "Cannot patch the original 'vrecord'. Please login."
    else
      patch do
        url "https://avpres.net/patch/vrecord_2019-01-19_x_2019-01-19.diff"
        sha256 "ec8715a1579bdcff36e6d7281d2dbfded1daa99aa39a729b8efddcd7679498f0"
      end
      bin.install "vrecord"
      bin.install "qcview.lua"
      bin.install "vrecord_policy_ffv1.xml"
      bin.install "vrecord_policy_uncompressed.xml"
      bin.install "vtest" if build.with? "vtest"
      man1.install "vrecord.1"
      man1.install "vtest.1" if build.with? "vtest"
    end
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
