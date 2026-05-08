class Qcli < Formula
  desc "Report audiovisual metrics via libavfilter"
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools.git",
      tag:      "v1.4",
      revision: "982619270ff49987328343909ea2179d1af52004"
  license "GPL-3.0-or-later"
  head "https://github.com/bavc/qctools.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "qtmultimedia" => :build
  depends_on "qwt" => :build
  depends_on "avpres/formulae/ffmpeg"
  depends_on "qtbase"

  on_linux do
    depends_on "zlib-ng-compat"
  end

  def install
    ENV["USE_BREW"] = "true"

    cd "Project/QtCreator/qctools-lib" do
      system "qmake", "qctools-lib.pro"
      system "make"
    end
    cd "Project/QtCreator/qctools-cli" do
      system "qmake", "qctools-cli.pro"
      system "make"
      bin.install "qcli"
    end
  end

  test do
    # Create an example mp4 file
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg", "-filter_complex", "testsrc=rate=1:duration=1", mp4out

    # Create a qcli report from the mp4
    qcliout = testpath/"video.mp4.qctools.xml.gz"
    system bin/"qcli", "-i", mp4out, "-o", qcliout
    assert_path_exists qcliout
  end
end
