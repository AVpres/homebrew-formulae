class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2026-03-08.tar.gz"
  sha256 "03a1392aa3c4a23644d75e5869a690590fc7dc36fd07948577bba3f711fc84fe"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    system "majordomo.pl"
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    assert_path_exists bin/"bash_avpres"
  end
end
