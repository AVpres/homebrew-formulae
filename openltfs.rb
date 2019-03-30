class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-03-16.tar.gz"
  version "2019-03-16"
  sha256 "0b925941be93a76c1554813a0ee06d9c325c21c6cc5b3fed51d49cb06e589391"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "Sorry, the 'libltfs' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openltfs_2019-03-30.diff"
        sha256 "5c5a3aae1206dbfddd7c0c68b44dccd62ccd8299864b5c34c24fb0eeadf02e64"
      end
      bin.install "libltfs"
      bin.install "ltfs"
      bin.install "mkltfs"
      bin.install "chkltfs"
      man1.install "libltfs.1"
      man1.install "ltfs.1"
      man1.install "mkltfs.1"
      man1.install "chkltfs.1"
    end
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
