class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash/"
  url "https://avpres.net/releases/bash-avpres-2020-08-15.tar.gz"
  sha256 "23bda51b9b706c4084b6a374468c3f481b84e1dd40cd5838dee08c21c3088da5"
  license "BSD-3-Clause"

  def install
    bin.install Dir["src/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
