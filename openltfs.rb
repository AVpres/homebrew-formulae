class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2020-04-04.tar.gz"
  sha256 "fb8b13aba09386bb7a7c27602385930a66fe7347c4cb7f1cb2a7204e5084e21b"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openltfs-2020-04-04.diff"
          sha256 "b68935fca6f29a2f165599d8d2278c8eaa0cc5b3e7f155ed56adefc66e437a6d"
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
