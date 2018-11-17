class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-11-17.tar.gz"
  version "2018-11-17"
  sha256 "3cecbad9e70697cbeed5f59882131bad586251acb7fe9f4c9e5333a153ca5f5c"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libltfs' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openltfs_2018-10-06.diff"
        sha256 "067f2a7bc97310a7b5501aa6dc404dd79304c2d37ea52e0aaef9b083cf6c7793"
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
