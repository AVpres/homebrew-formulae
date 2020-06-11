class FfcommandEngine < Formula
  desc "Instals the FFCommand_Engine app by Colorlab"
  homepage "https://github.com/ColorlabMD/FFCommand_Engine"
  head "https://github.com/ColorlabMD/FFCommand_Engine.git"

  depends_on "pkg-config" => :build
  depends_on "qt" => :build
  depends_on "qwt" => :build

  def install
    cd "FFCommand_Engine" do
      system "PATH=/usr/local/opt/qt/bin:$PATH"
      system "LDFLAGS=-L/usr/local/opt/qt/lib"
      system "CPPFLAGS=-I/usr/local/opt/qt/include"
      system "PKG_CONFIG_PATH=/usr/local/opt/qt/lib/pkgconfig"

      system "qmake", "FFCommand_Engine.pro"
      system "qmake"
      system "make"
      prefix.install "FFCommand_Engine.app"
    end
  end

  def caveats
    <<~EOS
      After installation, you need to pass to the Terminal:
      cp -R #{prefix}/FFCommand_Engine.app /Applications
    EOS
  end

  test do
    system("open #{prefix}/FFCommand_Engine.app")
  end
end
