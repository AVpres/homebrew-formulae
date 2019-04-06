class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-04-06.tar.gz"
  version "2019-04-06"
  sha256 "21e1a80052090a899354027adfda83dede6b913a2a16ed2af25dafc9b6b7e049"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "Sorry, the 'libltfs' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openltfs_2019-04-06.diff"
        sha256 "f5e73c552faa5526c21d14a4f5c54ed1960221ed8a2a26e19c7edbe667efba15"
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
