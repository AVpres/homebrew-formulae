class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash/"
  url "https://avpres.net/releases/bash-avpres-2020-08-08.tar.gz"
  sha256 "02224ce08d82c368984ccc48a04bb6b5c2f8d6b44ea858829692ea346ee21606"
  license "BSD-3-Clause"

  def install
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
