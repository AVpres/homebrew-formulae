class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash/"
  url "https://avpres.net/releases/bash-avpres-2020-07-28.tar.gz"
  sha256 "b049a14c853e845b3c27e66e5c67b81565a8564bec8d5977ba168544b6144b36"
  license "BSD-3-Clause"
  revision 2

  def install
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
