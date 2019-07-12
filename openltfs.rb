class Openltfs < Formula
  desc "Handle LTFS openly and neutrally"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2019-07-13.tar.gz"
  sha256 "ea9045fcf09f67fd68a685ef5cadfe1ba801a611876b8a2a146c1c3ec12a0c74"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openltfs-2019-07-13.diff"
          sha256 "7f948db2dacf60752cf9ec375be6ff71e3781b74a504382c93b1e898f5f3b553"
        end
        system "./configure"
        system "make", "install"
      end
      bin.install "openltfs"
    end
    cd "man" do
      man1.install "libltfs.1"
      man1.install "ltfs.1"
      man1.install "ltfsck.1"
      man1.install "ltfscp.1"
      man1.install "mkltfs.1"
      man1.install "openltfs.1"
    end
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
