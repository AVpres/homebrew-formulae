class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2020-05-30.tar.gz"
  sha256 "899cbab61d84a2c54580e771e45685d538f2d02e379eff869a951716c6d06ce7"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openltfs-2020-05-30.diff"
          sha256 "8aa383010b38eea14fe7be830371011c3e27c346a8fb46381b7b613019c9214e"
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
