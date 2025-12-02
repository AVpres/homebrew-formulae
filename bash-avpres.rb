class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-12-02.tar.gz"
  sha256 "f4bd52e879824f47aff9d6edbb27312e3b217451de783ecedf2d9f3b314472eb"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  def post_install
    system "bash_avpres"
  end

  test do
    assert_path_exists bin/"bash_avpres"
  end
end
