class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-09-22.tar.gz"
  version "2018-09-22"
  sha256 "435cd466de564c70f089dc7d25f2b0911222d1631df70603b0a5969223c921bd"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libltfs' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openltfs_2018-09-22.diff"
        sha256 "d88983164fb763f18974f23e5b1588b919f4e4cfe6eada2f070c6e5204a08e8a"
      end
      bin.install "libltfs"
      bin.install "ltfs"
      bin.install "mkltfs"
      bin.install "ckltfs"
    end
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
