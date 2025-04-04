# typed: true
# frozen_string_literal: true

# Bash scripts for audiovisual preservation
class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2024-12-15.tar.gz"
  sha256 "063c8da5533bfb33021a34cb5f27cb229e7de5eedaf730fc4e6d8999b3dcb270"
  license "BSD-3-Clause"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
