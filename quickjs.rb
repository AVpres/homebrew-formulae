class Quickjs < Formula
  desc "Javascript Engine"
  homepage "https://bellard.org/quickjs/"
  url "https://bellard.org/quickjs/quickjs-2019-07-09.tar.xz"
  sha256 "350c1cd9dd318ad75e15c9991121c80b85c2ef873716a8900f811554017cd564"

  bottle :unneeded

  def install
    system "make"
    bin.install "qjs"
    bin.install "qjsc"
    bin.install "qjsbn"
    bin.install "qjsbnc"
  end

  test do
    system "#{bin}/qjs", "-h"
  end
end
