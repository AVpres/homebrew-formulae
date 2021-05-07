class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2021-05-08.tar.gz"
  sha256 "5398ebcd4631bfedfb4a0e64beda817f9df541c009c6c450abcb5fd6ac36eb5c"
  license "BSD-3-Clause"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
