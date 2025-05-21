class BashAvpres < Formula
  desc "Bash scripts for audio-visual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2025-05-22.tar.gz"
  sha256 "044c1596ce6ea4f62042e53606b5fbd3fb373e385b510a136dcacfeb21df8c41"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system bin/"bash_avpres"
  end
end
