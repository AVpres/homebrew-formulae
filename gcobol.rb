class Gcobol < Formula
  desc "Implements much of the COBOL 85 and COBOL 2002 standards"
  homepage "https://sourceforge.net/projects/open-cobol/"
  url "https://downloads.sourceforge.net/project/open-cobol/gnu-cobol/2.2/gnucobol-2.2.tar.xz"
  sha256 "dc18fc45c269debfe86a4bbe20a7250983cba6238ea1917e135df5926cd024a0"

  head do
    url "https://downloads.sourceforge.net/project/open-cobol/gnucobol/3.0/gnucobol-3.0-rc1.tar.xz"
    sha256 "bf76441ee7f8dc9aeb78291231f32273eafc4ec827f26840846a257a04bbc594"
  end

  depends_on "berkeley-db"
  depends_on "gmp"

  conflicts_with "gnu-cobol",
    because: "both install `cob-config`, `cobc` and `cobcrun` binaries"
  conflicts_with "open-cobol",
    because: "both install `cob-config`, `cobc` and `cobcrun` binaries"

  def install
    gmp = Formula["gmp"]
    bdb = Formula["berkeley-db"]
    ENV.append "CPPFLAGS", "-I#{gmp.opt_include} -I#{bdb.opt_include}"
    ENV.append "LDFLAGS", "-L#{gmp.opt_lib} -L#{bdb.opt_lib}"

    system "./configure", "--disable-debug",
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
