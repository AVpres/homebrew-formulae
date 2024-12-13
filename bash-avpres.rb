# typed: true
# frozen_string_literal: true

# Bash scripts for audiovisual preservation
class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2024-12-13.tar.gz"
  sha256 "0ca5544b837088f018350b98bbc76c5e12534b5715db06d25464c34d774ed370"
  license "BSD-3-Clause"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
