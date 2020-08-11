class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash/"
  url "https://avpres.net/releases/bash-avpres-2020-08-12.tar.gz"
  sha256 "2dd330de8b0cbce0329d10a7151d1ed468896138c77c99de4a7a821f296ddfda"
  license "BSD-3-Clause"

  def install
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
