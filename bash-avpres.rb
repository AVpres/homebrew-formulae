class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2026-01-25.tar.gz"
  sha256 "76c32d95fb3bc137e5a1fe8b9020e80c070d420cbd978a26a600a0ef8f745d76"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    assert_path_exists bin/"bash_avpres"
  end
end
