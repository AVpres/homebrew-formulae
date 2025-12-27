class Test < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/test_9999-99-99.tar.gz"
  sha256 "6873adc34c375d569fd0146b9c0aff95791581d820e0f57142835d1bed375583"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    system "./configure"
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
    system "make", "clean"
  end

  test do
    assert_path_exists bin/"bash_avpres"
  end
end
