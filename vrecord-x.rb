class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2019-05-03.tar.gz"
  version "2019-05-03"
  sha256 "8775b2502c33d1a0397250a78f6527194897c39865ae3855e832f1ee8a736693"

  bottle :unneeded

  option "with-doc", "Install the documentation"
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
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Sorry, cannot patch the original 'vrecord'. Please login."
    else
      patch do
        url "https://avpres.net/patch/vrecord_2019-05-03_x_2019-05-04.diff"
        sha256 "4183a25486a65a808878dc7d4b96bfebbd8a642ee8dee20c00a22427ece2f825"
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
