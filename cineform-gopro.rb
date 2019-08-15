class CineformGopro < Formula
  desc "GoPro's static CineForm library"
  homepage "https://gopro.github.io/cineform-sdk"
  url "https://github.com/gopro/cineform-sdk/archive/v10.0.2.tar.gz"
  sha256 "853057490db36746d77e7922b087117e2de9d05dd75742692cb12aa1d552711c"
  head "https://github.com/gopro/cineform-sdk.git"

  bottle :unneeded

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
