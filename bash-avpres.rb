class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash/"
  url "https://avpres.net/releases/bash-avpres-2020-07-26.tar.gz"
  sha256 "6310888ffbb82d1152099858ed87a34c8fbcd8d47d204c50c8bf97e4a35cbfdc"
  license "BSD-3-Clause"

  def install
    cd "src" do
      bin.install "bash_avpres"
      bin.install "engine_ffmprovisr"
      bin.install "ffmpeg_head"
      bin.install "make_bagit"
      bin.install "make_cs_manifest"
      bin.install "make_h264"
      bin.install "make_prores"
      bin.install "nano_config"
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
