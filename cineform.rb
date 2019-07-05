class Cineform < Formula
  desc "The CineForm codec"
  homepage "https://gopro.github.io/cineform-sdk/"
  url "https://github.com/gopro/cineform-sdk/archive/v10.0.1.tar.gz"
  sha256 "89d170267a52cb7a0bf94d7ce18ac36d0b4d9f42d795aa7bf49e701b5259a28b"
  head "https://github.com/gopro/cineform-sdk.git"

  bottle :unneeded

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    system "cmake", "."
    system "make"
    bin.install "libCFHDCodec.a"
  end
end
