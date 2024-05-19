# typed: true
# frozen_string_literal: true

# LTFS for both tape drives and DIY tape libraries
class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2024-05-18.tar.gz"
  sha256 "9d11c05fd043eb79e01d583f3755a09456987ec35766651a8082d1d78cb4b9ba"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2024-05-18.diff"
        sha256 "70e266617a4e3aae8a4960d0aa0567e7c35159dd6e3f40c49fb1773888d4c42e"
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
