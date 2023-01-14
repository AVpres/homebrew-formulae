# typed: false
# frozen_string_literal: true

# GoPro's static CineForm library
class CineformGopro < Formula
  desc "GoPro's static CineForm library"
  homepage "https://gopro.github.io/cineform-sdk"
  url "https://github.com/gopro/cineform-sdk/archive/v10.1.1.tar.gz"
  sha256 "f82ac3e841185329a8a4a7a0752d7342159b71bab1cbf0a4eb0ca32e4a9ed48b"
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
