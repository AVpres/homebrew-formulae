class Openltfs < Formula
  desc "CLI for 'libltfs' library to handle LTFS openly and neutrally"
  homepage "https://avpres.net/openLTFS/"
  url "https://avpres.net/openLTFS/releases/2018-09-15.tar.gz"
  version "2018-09-15"
  sha256 "06291b662aa84439bc216cf24166ef3691885ab729c85d3f809a0a0495ee85d8"

  bottle :unneeded

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login >/dev/null`.empty?
      patch do
        url "https://avpres.net/patch/openltfs_2018-09-15.diff"
        sha256 "067fbc971267f6a68e4aba20fecf07ac8b2a5e8401a76de03b84a0c4df069d43"
      end      
      bin.install "libltfs"
    else
      opoo "The 'libltfs' library cannot be installed. Please login."
    end
    bin.install "openltfs"
    man1.install "openltfs.1"
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
