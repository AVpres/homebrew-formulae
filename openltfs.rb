class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-05-18.tar.gz"
  version "2019-05-18"
  sha256 "23460a555fb579443f589f3e3ad70772d91e4e25dc141989db7b44cc6340a55b"

  bottle :unneeded

  def install
    cd "src" do
      if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
        opoo "Sorry, the 'libltfs' library cannot be installed. Please login."
      else
        patch do
          url "https://avpres.net/patch/openltfs_2019-05-18.diff"
          sha256 "4d238480588129467d780ef6ea22754efea8460524176350396189732c7eebf3"
        end
        system "make"
        bin.install "libltfs"
        bin.install "ltfs"
        bin.install "mkltfs"
        bin.install "chkltfs"
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
