# typed: false
# frozen_string_literal: true

# LTFS for both tape drives and DIY tape libraries
class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2022-12-03.tar.gz"
  sha256 "41bd7c8323acc0864a359abd04f94bead184a80458ed18b778c9121443d78d53"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2022-12-03.diff"
        sha256 "186d40849ace010c60921f649659e0cee25c16f551b7152c56f577a078abdbd6"
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
