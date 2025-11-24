class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-11-24.tar.gz"
  sha256 "d78f340fdf0b2bf0213de022732b4a0991622eef934140e9259028e6ac201070"
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
