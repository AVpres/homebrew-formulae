class Hla < Formula
  desc "High Level Assembler (HLABE back end, LD linker)"
  homepage "http://plantation-productions.com/Webster/HighLevelAsm/"
  url "http://plantation-productions.com/Webster/HighLevelAsm/HLAv2.16/mac.hla.tar.gz"
  sha256 "861d60dc5a4cb692dfae00c5c69a79bb563702b4216de791157250a8eebc4482"

  bottle :unneeded

  def install
    cd "hla" do
      bin.install "hla"
      bin.install "hlaparse"
    end
  end

  test do
    system "#{bin}/hla", "-?"
  end
end
