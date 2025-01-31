# typed: true
# frozen_string_literal: true

# Bash scripts to manage LTO cartridges with LTFS
class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2025-01-31.tar.gz"
  sha256 "03ce621b55c53981fcdab6d0f4e05fd8023ad678a2c784ff7af7ddd173132738"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2025-01-31.diff"
        sha256 "8de336650eb3a1b33ca30e1ee52582937968d9a37815e9e7eec4501078243f36"
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
