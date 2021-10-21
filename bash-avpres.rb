class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2021-10-23.tar.gz"
  sha256 "d0d73a1cb45de0df7f42a5c928cfb4cafb10f548d6b55a6715cdd262e07428e4"
  license "BSD-3-Clause"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
