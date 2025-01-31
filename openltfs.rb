# typed: true
# frozen_string_literal: true

# LTFS for both tape drives and DIY tape libraries
class Openltfs < Formula
  desc "LTFS for both tape drives and DIY tape libraries"
  homepage "https://avpres.net/LTO_LTFS/LTFS/"
  url "https://avpres.net/releases/openltfs-2025-01-31.tar.gz"
  sha256 "7df3059273940eec2b955be5f5ec7df5e5e102c90bf92fb9b0081f749ee161c9"
  license "BSD-3-Clause"

  def install
    if `curl -s https://avpres.net/patch/ | grep -o login` == "login\n"
      opoo "Please login for full installation."
    else
      patch do
        url "https://avpres.net/patch/openltfs-2025-01-31.diff"
        sha256 "1655042d5c77da891623c8e0d73f1c0a051fd0a3a987cab0e6485dbe09a7eb95"
      end
      system "./configure", "--prefix=#{prefix}"
      system "make"
      lib.install Dir["lib/*"]
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  test do
    system "#{bin}/openltfs", "-t"
  end
end
