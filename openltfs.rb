class Openltfs < Formula
  desc "Handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-06-02.tar.gz"
  version "2019-06-02"
  sha256 "349e60227328be154c899a72550126c154320bce6348e4b30a537e5d7c2fcebb"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openltfs_2019-06-02.diff"
          sha256 "c4580f251129def9a9ac80446ea0bb5e5f2ac40ef33929a7379f1e5c8c12d777"
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
