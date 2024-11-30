# typed: true
# frozen_string_literal: true

# Bash scripts to manage LTO cartridges with LTFS
class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2024-11-30.tar.gz"
  sha256 "d9ce6e7f501330bc8f875bf3e53b932dafe532b63f06b0bc38074c9c8e0a20b3"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2024-11-30.diff"
        sha256 "2da07615bfc48b1203468ca326a05a1d5d33f1fcaa75905ed448bd3af526e4b7"
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
