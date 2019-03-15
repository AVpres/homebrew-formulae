class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-03-16.tar.gz"
  version "2019-03-16"
  sha256 "0b925941be93a76c1554813a0ee06d9c325c21c6cc5b3fed51d49cb06e589391"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libltfs' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openltfs_2019-03-16.diff"
        sha256 "4bb76d0d00ef7b827e37d62c4ac456567e79fc341d12cea13ff3ba94e0849cf3"
      end
      bin.install "libltfs"
      bin.install "ltfs"
      bin.install "mkltfs"
      bin.install "chkltfs"
    end
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
