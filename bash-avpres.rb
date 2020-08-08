class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash/"
  url "https://avpres.net/releases/bash-avpres-2020-08-09.tar.gz"
  sha256 "af04d6d3cd452d4218f7d00f25a00929e04299689d85c4df0d5e4b57496a1f9a"
  license "BSD-3-Clause"

  def install
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
