class Gprolog < Formula
  desc "Prolog top-Level (GNU Prolog)"
  homepage "http://www.gprolog.org/"
  url "ftp://gprolog.univ-paris1.fr/pub/gprolog/gprolog-1.4.5.tar.gz"
  sha256 "bfdcf00e051e0628b4f9af9d6638d4fde6ad793401e58a5619d1cc6105618c7c"

  bottle :unneeded

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
