class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2020-05-31.tar.gz"
  sha256 "ee8c8a8bb80b98dbb81111f2d058fa062e85aad9566eb5642fdc8b5546ffa544"

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openltfs-2020-05-31.diff"
          sha256 "02ac7d0f33ae65d3b1a9e955cf58e0868bc8211acee565785bd9ea24423c4b2a"
        end
        system "./configure", "--prefix=#{prefix}"
        system "make", "install"
      end
      bin.install "openltfs"
    end
    cd "man" do
      man1.install "libltfs.1"
      man1.install "ltfs.1"
      man1.install "ltfs_check.1"
      man1.install "ltfs_copy.1"
      man1.install "mkltfs.1"
      man1.install "openltfs.1"
    end
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
