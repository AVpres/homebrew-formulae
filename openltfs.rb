class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2025-05-02.tar.gz"
  sha256 "5cf2ad8fc8eae75ecf019a3548b8e38be947908fc603ee5c42d373a22ea25f19"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login.pl` == "login.pl\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2025-05-02.diff"
        sha256 "46eadc8100c194b32919cc3595062f184d119bfc3172843bb0a905f6375f2fdb"
      end
      system "./configure", "--prefix=#{prefix}"
      system "make"
      lib.install Dir["lib/*"]
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system bin/"openltfs", "-t"
  end
end
