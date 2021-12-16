class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2021-12-18.tar.gz"
  sha256 "2f16f5e0bd0741df0aa72d732e8858dfa314c5a4f8e220bed74848d643d9ac76"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2021-12-18.diff"
        sha256 "78c9b1a892f5a91d8699aa8e8d7db1e0e59cebea3a5e7863022a63f59293e207"
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
