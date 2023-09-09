# typed: true
# frozen_string_literal: true

# Bash scripts for audiovisual preservation
class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2023-09-09.tar.gz"
  sha256 "619e723afa7e6efb234101470199f56af3463e741743b36187b01ea7f1158b27"
  license "BSD-3-Clause"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
