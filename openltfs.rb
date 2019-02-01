class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2019-02-02.tar.gz"
  version "2019-02-02"
  sha256 "97e26aaf80ec6c1448d1e9c2e8aae511f6c4101b70367e292fdd819aed5f1578"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`
      opoo "The 'libltfs' library cannot be installed. Please login."
    else
      patch do
        url "https://avpres.net/patch/openltfs_2019-02-02.diff"
        sha256 "391f275738344209c3b37b91b99b74c66cba7d8fb244d0cd7e77c3bcf8c5f20e"
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
