# typed: true
# frozen_string_literal: true

# vrecord flavour running on Linux, macOS and Windows
class VrecordX < Formula
  desc "Vrecord flavour running on Linux, macOS and Windows"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/refs/tags/v2024-08-28.tar.gz"
  sha256 "6dbd9262a5279d5ddd4879cd61e0a2fa47aca41833a9e5b78048661aaa7daa67"


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
        url "https://avpres.net/patch/vrecord_2024-08-28_x_2024-08-29.diff"
        sha256 "db818d5080e6a69ca5646499a5cef57b4efa1ce0cce60e74c495bdb5d06ee0c9"
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
