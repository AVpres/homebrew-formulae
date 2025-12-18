class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-12-19.tar.gz"
  sha256 "635a22ada6ffa2d235d03c6ed00e299b3a8429abde2e4ce8a6a2bf5587af8770"
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
