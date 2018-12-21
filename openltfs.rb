class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-12-22.tar.gz"
  version "2018-12-22"
  sha256 "411f7f18dacb867eba038773df8e8c4fd8aa561504cdced1144b5337328fc9c9"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libltfs' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openltfs_2018-12-22.diff"
        sha256 "a8d1bf12796f1236d981b7b7df5cc72451149feff7f94833aa09d78ac9a3fa78"
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
