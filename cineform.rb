class Cineform < Formula
  desc "Alternate static and shared CineForm librairies"
  homepage "https://github.com/emericg/libcineform"
  url "https://github.com/emericg/libcineform/archive/v0.2.tar.gz"
  sha256 "7749cc6ccbd2b05ac8c942045396f06735dda5a87f5cd0166752570fd2be0cac"
  head "https://github.com/emericg/libcineform.git"

  bottle :unneeded

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    cd "build" do
      system "cmake", "-DBUILD_STATIC_LIBS:BOOL=ON",
                      "-DBUILD_SHARED_LIBS:BOOL=ON",
                      ".."
      system "make"
      lib.install "libcineform.a"
      lib.install "libcineform.so" if OS.linux?
      lib.install "libcineform.dylib" if OS.mac?
      # lib.install "libcineform.dll" if OS.windows?
    end
  end
end
