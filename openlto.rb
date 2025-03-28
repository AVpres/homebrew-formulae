# typed: true
# frozen_string_literal: true

# Bash scripts to manage LTO cartridges with LTFS
class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2025-03-28.tar.gz"
  sha256 "a879c4e47c7dbf470e09effb9d65e48dfa5078936e906389660e2bf3f21e6aea"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2025-03-28.diff"
        sha256 "b92d7832d3b9c2fe277c572d3ba6b683cfdecc17198d6282439600d89737dc7a"
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
