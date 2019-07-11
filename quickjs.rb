class Quickjs < Formula
  desc "Javascript Engine"
  homepage "https://bellard.org/quickjs/"
  url "https://bellard.org/quickjs/quickjs-2019-07-09.tar.xz"
  sha256 "350c1cd9dd318ad75e15c9991121c80b85c2ef873716a8900f811554017cd564"

  bottle :unneeded

  option "with-bn", "Install big number support"

  def install
    system "make"
    bin.install "qjs"
    bin.install "qjsc"
    bin.install "qjsbn" if build.with? "bn"
    bin.install "qjsbnc" if build.with? "bn"
  end

  test do
    system "#{bin}/qjs", "-h"
  end
end
