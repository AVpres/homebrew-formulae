class Cpio < Formula
  desc "Copy files to and from archives"
  homepage "https://www.gnu.org/software/cpio/"
  url "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz"
  sha256 "e87470d9c984317f658567c03bfefb6b0c829ff17dbf6b0de48d71a4c8f3db88"

  bottle :unneeded

  def install
    system "./configure"
    system "make"
    system "make", "install"
    bin.install "cpio"
  end

  test do
    system "#{bin}/cpio", "--version"
  end
end
