class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash/"
  url "https://avpres.net/releases/bash-avpres-2020-07-25.tar.gz"
  sha256 "696ac5620ea0adc9f11e74f94e420561edd4b9da7879324ee4bd452f7104304d"
  license "BSD-3-Clause"

  def install
    cd "src" do
      bin.install "make_bagit"
      bin.install "make_h264"
      bin.install "make_prores"
    end
    cd "man" do
      man1.install "make_bagit.1"
      man1.install "make_h264.1"
      man1.install "make_prores.1"
    end
  end

  test do
    system "#{bin}/make_bagit", "-h"
    system "#{bin}/make_h264", "-h"
    system "#{bin}/make_prores", "-h"
  end
end
