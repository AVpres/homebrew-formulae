# typed: true
# frozen_string_literal: true

# Bash scripts to manage LTO cartridges with LTFS
class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2024-05-18.tar.gz"
  sha256 "78f01fbc8faa3c3a605b7f67cb196c4b3c837c4d073f4d3a04d33c0e04bfcaac"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2024-05-18.diff"
        sha256 "270d0b4e11d10e1ef06b2cacf8c91101557ad12332d035983fac5aac84df4ad6"
      end
      system "./configure"
      system "make"
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openlto", "-h"
  end
end
