class Gcobol < Formula
  desc "Implements much of the COBOL 85 and COBOL 2002 standards"
  homepage "https://sourceforge.net/projects/open-cobol/"
  url "https://downloads.sourceforge.net/project/open-cobol/gnu-cobol/2.2/gnucobol-2.2.tar.xz"
  sha256 "dc18fc45c269debfe86a4bbe20a7250983cba6238ea1917e135df5926cd024a0"

  devel do
    url "https://downloads.sourceforge.net/projects/open-cobol/gnu-cobol/3.0/gnucobol-3.0-rc1.tar.xz"
    sha256 "651d2d279de544981c652edcb68a3d8faee368542b923c989b5e0fe26d772aa4"
  end

  depends_on "berkeley-db"
  depends_on "gmp"

  def install
    # both environment variables are needed to be set
    # the cobol compiler takes these variables for calling cc during its run
    # if the paths to gmp and bdb are not provided, the run of cobc fails
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
            * COBOL must be indented
      000001 IDENTIFICATION DIVISION.
      000002 PROGRAM-ID. hello.
      000003 PROCEDURE DIVISION.
      000004 DISPLAY "Hello World!".
      000005 STOP RUN.
    EOS
    system "#{bin}/cobc", "-x", "hello.cob"
    system "./hello"
  end
end
