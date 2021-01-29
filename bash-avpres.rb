class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2021-01-30.tar.gz"
  sha256 "20e2cbf5ad27bff82b9ede0c5700bb39823926f4cec199aa81a46dd0a9dc7c71"
  license "BSD-3-Clause"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
