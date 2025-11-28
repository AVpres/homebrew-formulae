class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-11-28.tar.gz"
  sha256 "e53a6ac45dc2080ba200d5c40735d8b4452b9dcec02cdc32e935b2130ff1a9a1"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  def post_install
    system bin/"bash_avpres"
  end

  test do
    assert_path_exists bin/"bash_avpres"
  end
end
