class FfcommandEngine < Formula
  desc "Instals the FFCommand_Engine app by Colorlab"
  homepage "https://github.com/ColorlabMD/FFCommand_Engine"
  revision 3
  head "https://github.com/ColorlabMD/FFCommand_Engine.git"

  depends_on "pkg-config" => :build
  depends_on "qt@5" => :build
  depends_on "qwt-qt5" => :build

  def install
    cd "FFCommand_Engine" do
      system "PATH=/usr/local/opt/qt5/bin:$PATH"
      system "LDFLAGS=-L/usr/local/opt/qt5/lib"
      system "CPPFLAGS=-I/usr/local/opt/qt5/include"
      system "PKG_CONFIG_PATH=/usr/local/opt/qt5/lib/pkgconfig"
      system "qmake", "FFCommand_Engine.pro"
      system "qmake"
      system "make"
      prefix.install "FFCommand_Engine.app"
    end
  end

  def caveats
    <<~EOS
      After installation, you need to run in the Terminal:
      cp -R #{prefix}/FFCommand_Engine.app /Applications
    EOS
  end

  test do
    system("open", "#{prefix}/FFCommand_Engine.app")
  end
end
