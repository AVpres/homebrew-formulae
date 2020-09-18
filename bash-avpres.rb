class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2020-09-19.tar.gz"
  sha256 "e77c32b13ca45f9a538aac3c310dd999c332f52fbe64285fceffbe0ee7562f4d"
  license "BSD-3-Clause"

  def install
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
