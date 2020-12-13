class Gcobol < Formula
  desc "Implements much of the COBOL 85 and COBOL 2002 standards"
  homepage "https://sourceforge.net/projects/gnucobol/"
  url "https://downloads.sourceforge.net/project/gnucobol/gnucobol/3.1/gnucobol-3.1.1.tar.xz"
  sha256 "c1b1d7dead3b141ed2f30102934e94b48d01845c79fccf19110f34016970f423"
  license "GPL-3.0-or-later"

  depends_on "berkeley-db"
  depends_on "gmp"

  conflicts_with "gnu-cobol", because: "both install `cob-config`, `cobc` and `cobcrun` binaries"
  conflicts_with "open-cobol", because: "both install `cob-config`, `cobc` and `cobcrun` binaries"

  def install
    gmp = Formula["gmp"]
    bdb = Formula["berkeley-db"]
    ENV.append "CPPFLAGS", "-I#{gmp.opt_include} -I#{bdb.opt_include}"
    ENV.append "LDFLAGS", "-L#{gmp.opt_lib} -L#{bdb.opt_lib}"

    system "./configure",
           "--disable-debug",
           "--disable-dependency-tracking",
           "--disable-silent-rules",
           "--prefix=#{prefix}",
           "--with-libiconv-prefix=/usr",
           "--with-libintl-prefix=/usr"
    system "make", "install"
  end

  test do
    (testpath/"hello.cob").write <<~EOS
      000001 IDENTIFICATION DIVISION.
      000002 PROGRAM-ID. hello.
      000003 PROCEDURE DIVISION.
      000004 DISPLAY "Hello, Mars!".
      000005 STOP RUN.
    EOS
    system "#{bin}/cobc", "-x", "hello.cob"
    system "./hello"
  end
end
