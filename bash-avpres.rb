class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash/"
  url "https://avpres.net/releases/bash-avpres-2020-07-27.tar.gz"
  sha256 "842a0037445f77f8abe4694a96460196c60a1b1de3a87175ef9020da95cb757e"
  license "BSD-3-Clause"
  revision 1

  def install
    cd "src" do
      bin.install "bash_avpres"
      bin.install "engine_ffmprovisr"
      bin.install "ffmpeg_head"
      bin.install "make_bagit"
      bin.install "make_cs_manifest"
      bin.install "make_framemd5"
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
