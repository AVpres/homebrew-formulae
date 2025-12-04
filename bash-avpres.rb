class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-12-04.tar.gz"
  sha256 "e088916093f8ed21e7d9c17a56b5ba34579f3fa9888c76a611d7e03d733fbf5d"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  def post_install
    "bash_avpres"
  end

  test do
    assert_path_exists bin/"bash_avpres"
  end
end
