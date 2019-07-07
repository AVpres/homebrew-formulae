class Cineform < Formula
  desc "Alternate static and dynamic CineForm librairies"
  homepage "https://github.com/emericg/libcineform"
  url "https://github.com/emericg/libcineform/archive/0.1.tar.gz"
  sha256 "15122bfdc3839a7f41f62b3df74d8f7f12bb17aa0faea770ca221e395598875e"
  head "https://github.com/emericg/libcineform.git"

  bottle :unneeded

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    cd "build" do
      system "cmake",
             "-DBUILD_STATIC_LIBS:BOOL=ON",
             "-DBUILD_SHARED_LIBS:BOOL=ON",
             ".."
      system "make"
      lib.install "libcineform.a"
      lib.install "libcineform.dylib"
    end
  end
end
