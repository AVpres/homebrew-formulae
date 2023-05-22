# typed: true
# frozen_string_literal: true

# LTFS for both tape drives and DIY tape libraries
class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2023-05-20.tar.gz"
  sha256 "24b696f4eec2a7de6b893242760385e78ec5e57772851129bf6b85d9305c8a1d"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2023-05-10.diff"
        sha256 "01d4d9171db0e247995c92f24632e8e3fb3443fcb4d225972ea1fa439ca3e32c"
      end
      system "./configure", "--prefix=#{prefix}"
      system "make"
      lib.install Dir["lib/*"]
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
