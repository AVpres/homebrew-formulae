class LibewfOld < Formula
  desc "Library for support of the Expert Witness Compression Format"
  homepage "https://github.com/libyal/libewf"
  url "https://github.com/libyal/libewf-legacy/releases/download/20140812/libewf-20140812.tar.gz"
  sha256 "be90b7af2a63cc3f15d32ce722a19fbd5bbb0173ce20995ba2b27cc9072d6f25"
  license "LGPL-3.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "openssl@1.1"

  uses_from_macos "bzip2"
  uses_from_macos "zlib"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ewfinfo -V")
  end
end
