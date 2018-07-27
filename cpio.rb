class Cpio < Formula
  desc "Copy files to and from archives"
  homepage "https://www.gnu.org/software/cpio/"
  url "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.gz"
  sha256 "08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713a92e73"

  bottle :unneeded

  option "with-mt", "Install mt - Control magnetic tape drive operation"

  def install
    args = "--enable-mt" if build.with? "mt"
    system "./configure", *args
    system "make"
    system "make", "install"
    bin.install "cpio"
    bin.install "mt" if build.with? "mt"
  end

  test do
    system "#{bin}/cpio", "--version"
    system "#{bin}/mt", "--version" if build.with? "mt"
  end
end
