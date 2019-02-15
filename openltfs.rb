class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-02-16.tar.gz"
  version "2019-02-16"
  sha256 "0794ca5498031ffaec6e8cf39bd1aeda30c9e6b9a836d3b1b07cb6e1abec4ade"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libltfs' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openltfs_2019-02-16.diff"
        sha256 "6b87feab85a43ce62d01c0b5a656357b803713d61c4d767c17dc87a59c195062"
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
