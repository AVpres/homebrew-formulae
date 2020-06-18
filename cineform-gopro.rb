class CineformGopro < Formula
  desc "GoPro's static CineForm library"
  homepage "https://gopro.github.io/cineform-sdk"
  url "https://github.com/gopro/cineform-sdk/archive/v10.0.2a.tar.gz"
  sha256 "f63edd32d33a97ad89fc9490932a267f3cc69ac5b116458dfd2a4d27510cf193"
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
