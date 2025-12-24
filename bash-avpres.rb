class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-12-25.tar.gz"
  sha256 "8a95b13ddc4d0bec4f1c951e623199f775c30a29fbe2f96abd3c7b09a5d46839"
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
