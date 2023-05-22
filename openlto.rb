# typed: true
# frozen_string_literal: true

# Bash scripts to manage LTO cartridges with LTFS
class Openlto < Formula
  desc "Bash scripts to manage LTO cartridges with LTFS"
  homepage "https://avpres.net/LTO_LTFS/LTO/"
  url "https://avpres.net/releases/openlto-2023-05-20.tar.gz"
  sha256 "615283e69732d47047a4315cbaf5475ab9ea008a317bd929bb7e7a72ca7046f3"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openlto-2023-05-20.diff"
        sha256 "6655673de8731be2a9c80ae83008e964445875b693a8a3595dccea7840299a46"
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
