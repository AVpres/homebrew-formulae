class Openltfs < Formula
  desc "Handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-07-06.tar.gz"
  version "2019-07-06"
  sha256 "63956c0688b675550b31bf9d482b6e582c45ff6d41a66daec511c64adad24c3c"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
        opoo "Please login for full installation."
      else
        patch do
          url "https://avpres.net/patch/openltfs_2019-07-06.diff"
          sha256 "c33fe37b4e97d659781263f95ddcb428ec0dce6dd63b361dbbc6db19509d5a40"
        end
        system "./configure", "--prefix=#{prefix}"
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
