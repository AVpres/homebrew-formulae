class Gprolog < Formula
  desc "Prolog top-level (GNU Prolog)"
  homepage "http://www.gprolog.org/"
  url "ftp://ftp.gnu.org/gnu/gprolog/gprolog-1.5.0.tar.gz"
  sha256 "670642b43c0faa27ebd68961efb17ebe707688f91b6809566ddd606139512c01"

  def install
    cd "src" do
      system "./configure"
      system "make"
      cd "TopComp" do
        bin.install "gprolog"
        bin.install "gplc"
        bin.install "hexgplc"
      end
    end
  end

  test do
    system "#{bin}/gprolog", "--help"
    system "#{bin}/gplc", "--help"
    system "#{bin}/hexgplc", "--help"
  end
end
