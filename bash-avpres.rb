class BashAvpres < Formula
  desc "Bash scripts for audiovisual preservation"
  homepage "https://avpres.net/Bash_AVpres/"
  url "https://avpres.net/releases/bash-avpres-2026-05-18.tar.gz"
  sha256 "7fcba6b6a06d6f18b41f819ae4ce6950bf23247ac79ee283cb1a5e31660ef066"
  license "BSD-3-Clause"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "xxhash"

  def install
    cd "bash_avpres" do
      system "./majordomo.sh"
    end
    bin.install Dir["bin/*"]
    man1.install Dir["man/*"]
  end

  def caveats
    on_linux do
      <<~EOS
        If you wish to use the CRC32 algorithm, you may need to install a CRC32 tool,
        because some Linux distributions do not include it:
          sudo apt install libarchive-zip-perl
      EOS
    end
  end

  test do
    assert_path_exists bin/"bash_avpres"
  end
end
