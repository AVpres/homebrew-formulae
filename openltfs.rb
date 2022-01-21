class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2022-01-22.tar.gz"
  sha256 "b832083cb17a145d5d4f7ff09bcea6f74dd478ee917331a526c9d40775327813"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2022-01-22.diff"
        sha256 "e4a60c2312a69a90827c2dbe0294bfbe1d0b2f1ddb301419a34f785aa550b5aa"
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
