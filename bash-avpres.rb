# typed: false
# frozen_string_literal: true

# Bash scripts for audiovisual preservation
class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2023-03-25.tar.gz"
  sha256 "9de1d489b8c67f9e70fd179beaa01763d9258c5ff1f7bffdbf8216e1a67b349a"
  license "BSD-3-Clause"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
