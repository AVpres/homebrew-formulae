# typed: true
# frozen_string_literal: true

# LTFS for both tape drives and DIY tape libraries
class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2024-11-30.tar.gz"
  sha256 "2ee3347c0ae6f31fde295c40d483a27a57b1ab8fd07784e68665146ad7cba809"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2024-11-30.diff"
        sha256 "68e3ac93eea9e7f567412d7a66c2596d3d226806bbfb32c15e76385a716076cd"
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
