class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2022-08-13.tar.gz"
  sha256 "861a28f0c23f7a6b4faaacedc4063a528c88bee26cbced52e1fc0fd751842e16"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2022-08-13.diff"
        sha256 "147282da8df9d0ffa561b0e9d4f0c97e0006cc0ca9ccb452e0d4b1ad2c13f6ee"
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
