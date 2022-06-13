class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2022-05-14.tar.gz"
  sha256 "513a2f24c0fb238554c580ea40744d4a0082e52ce44f15b40ae7420948f2b9f4"
  license "BSD-3-Clause"
  revision 1

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2022-05-14.diff"
        sha256 "2dc70d67afe3ce0069287e1e77e481eeb6012273dcce310cd0b61f891355ff65"
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
