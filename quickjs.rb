class Quickjs < Formula
  desc "Javascript Engine"
  homepage "https://bellard.org/quickjs/"
  url "https://bellard.org/quickjs/quickjs-2019-07-21.tar.xz"
  sha256 "a906bed24c57dc9501b84a5bb4514f7eac58db82b721116ec5abe868490e53cc"
  revision 1

  bottle :unneeded

  option "with-bn", "Install big number support"

  def install
    opoo "QuickJS is now available as a regular Homebrew formula. Please use it!"
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
