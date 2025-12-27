class Test < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-12-25.tar.gz"
  sha256 "7ebcfe1a1613990933d09fbeae0459a8c9b089fea15ff55226c11765de1a74ea"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    system "./majordomo.sh"
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    assert_path_exists bin/"bash_avpres"
  end
end
