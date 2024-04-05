# typed: true
# frozen_string_literal: true

# instals the Flite library
class Flite < Formula
  desc "Instals the Flite library"
  head "https://github.com/festvox/flite.git"

  depends_on "pkg-config" => :build

  def install
    system "./configure"
    system "make"
    system "make", "install"
    lib.install "libflite"
  end
end
