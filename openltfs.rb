class Openltfs < Formula
  desc "Handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-06-15.tar.gz"
  version "2019-06-15"
  sha256 "23063f57315f393245f39d9655be6cdbb0fa6c0aae3183141fcc09f5de06e6ef"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openltfs_2019-06-15.diff"
          sha256 "91f3aaf9c7681f7c905701e3382896fce0a4c5d8dacb51b8bd5d9870ab0f7d39"
        end
        system "./configure"
        system "make", "install"
      end
      bin.install "openltfs"
    end
    cd "doc" do
      man1.install "libltfs.1"
      man1.install "ltfs.1"
      man1.install "ltfsck.1"
      man1.install "mkltfs.1"
      man1.install "openltfs.1"
    end
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
