# typed: false
# frozen_string_literal: true

# Bash scripts for audiovisual preservation
class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2023-02-11.tar.gz"
  sha256 "bef5321209365a8bbf1228469443d7a53812766a472927d399bbcebbd62ff39a"
  license "BSD-3-Clause"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/bash_avpres"
  end
end
