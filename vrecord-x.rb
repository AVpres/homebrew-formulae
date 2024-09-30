# typed: true
# frozen_string_literal: true

# vrecord flavour running on Linux, macOS and Windows
class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/refs/tags/v2024-08-28.tar.gz"
  sha256 "6dbd9262a5279d5ddd4879cd61e0a2fa47aca41833a9e5b78048661aaa7daa67"
  revision 1

  option "with-doc", "Install the documentation locally"
  option "with-vtest", "Test streams from computer out to monitor through Blackmagic card"

  depends_on "pandoc" => :build

  depends_on "amiaopensource/amiaos/decklinksdk"
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

  conflicts_with "amiaopensource/amiaos/vrecord", because: "installs conflicting executables"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Sorry, cannot patch the original 'vrecord'. Please login."
    else
      patch do
        url "https://avpres.net/patch/vrecord_2024-08-28_x_2024-09-30.diff"
        sha256 "5782e529da09eea028a42e96c330d464d0d3ffa3f5e0997ae40102234b12a1eb"
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
