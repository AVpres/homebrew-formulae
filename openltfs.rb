class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2021-08-28.tar.gz"
  sha256 "a97cefe324c026e209538b62b32cc33b40534f9b3cc0fafa0ebc3a1b1ceda721"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2021-08-28.diff"
        sha256 "c1a1090c06f585afb758e42dd1b52732623b3ec459adff6e0cd72d87a1bdd672"
      end
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
