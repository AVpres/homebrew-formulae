class Openltfs < Formula
  desc "Handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-05-25.tar.gz"
  version "2019-05-25"
  sha256 "0d50f3893c5252bccae13e57d512a3530b5c5f5c308eb13b0bf5277e5ab71eef"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Please login for a full installation."
      else
        patch do
          url "https://avpres.net/patch/openltfs_2019-05-25.diff"
          sha256 "d6a8ed44b903d2b73102862acef8e7c3853d3ea1820215840651663e16fa98a3"
        end
        system "./configure"
        system "make", "install"
      end
      bin.install "openltfs"
    end
    cd "doc" do
      man1.install "libltfs.1"
      man1.install "ltfs.1"
      man1.install "mkltfs.1"
      man1.install "chkltfs.1"
      man1.install "openltfs.1"
    end
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
