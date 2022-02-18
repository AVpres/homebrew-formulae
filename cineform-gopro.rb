class CineformGopro < Formula
  desc "GoPro's static CineForm library"
  homepage "https://gopro.github.io/cineform-sdk"
  url "https://github.com/gopro/cineform-sdk/archive/v10.1.0.tar.gz"
  sha256 "7ce1cf322ef7d9d9cb2de66677b3fa2c5cc07e08f654e1c1381fca41f2a6a788"
  head "https://github.com/gopro/cineform-sdk.git"

  option "with-TestCFHD", "Install TestCFHD utility"
  option "with-WaveletDemo", "Install WaveletDemo utility"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    system "cmake", "."
    system "make"
    lib.install "libCFHDCodec.a"
    bin.install "TestCFHD" if build.with? "TestCFHD"
    bin.install "WaveletDemo" if build.with? "WaveletDemo"
  end

  test do
    system "#{bin}/TestCFHD" if build.with? "TestCFHD"
    system "#{bin}/WaveletDemo" if build.with? "WaveletDemo"
  end
end
