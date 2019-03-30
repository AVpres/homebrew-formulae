class Gprolog < Formula
  desc "Prolog top-Level (GNU Prolog)"
  homepage "http://www.gprolog.org/"
  url "ftp://gprolog.univ-paris1.fr/pub/gprolog/gprolog-1.4.5.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  bottle :unneeded

  def install
    cd "src" do
      system "./configure"
      system "make"
      system "make install"
    end
  end

  test do
    system "#{bin}/gprolog", "--help"
  end
end
