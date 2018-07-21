class Hla < Formula
  desc "hla"
  homepage "https://avpres.net/"
  url "https://avpres.net/hla-master.zip"
  sha256 "d59806d66c7c042b5cfee6c61fad1df69f6fa9b93c2aea56ac3fc00426088d1a"

  bottle :unneeded

  def install
    cd "macosx" do
      system "make"
      bin.install "hla"
    end
  end
end
