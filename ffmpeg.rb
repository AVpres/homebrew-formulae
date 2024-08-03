# typed: true
# frozen_string_literal: true

# alternate FFmpeg formula with options
class Ffmpeg < Formula
  desc "Alternate FFmpeg formula with options"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-7.0.2.tar.gz"
  sha256 "1233b3a93dd7517cc3c56b72a67f64041c044848d981e3deff4bebffa25f1054"
  license "GPL-2.0-or-later"
  head "https://github.com/FFmpeg/FFmpeg.git", branch: "master"

  option "with-aribb24", "Enable ARIB STD-B24, decoding JIS 8 bit characters and parsing MPEG-TS"
  option "with-aribcaption", "Enable ARIB STD-B24 based broadcast captions"
  option "with-bluray", "Enable Blu-Ray Discs playback"
  option "with-bs2b", "Enable Bauer stereophonic-to-binaural DSP"
  option "with-chromaprint", "Enable Chromaprint audio fingerprinting library"
  option "with-decklink", "Enable DeckLink support"
  option "with-dvd", "Enable DVD-Video demuxer, powered by libdvdnav and libdvdread"
  option "with-fdk-aac", "Enable Fraunhofer FDK AAC library"
  option "with-frei0r", "Enable frei0r filters, mixers and generators"
  option "with-game-music-emu", "Enable Game Music Emu (GME)"
  option "with-jack", "Enable Jack"
  option "with-jpeg-xl", "Enable JPEG XL image format"
  option "with-libcaca", "Enable libcaca"
  option "with-libflite", "Enable text to speech synthesis support via Flite"
  option "with-libgsm", "Enable lossy speech compression"
  option "with-libmodplug", "Enable module/tracker files as inputs via libmodplug"
  option "with-libopenmpt", "Enable module/tracker files as inputs via libopenmpt"
  option "with-libplacebo", "Enable GPU-accelerated image/video processing primitives"
  option "with-librist", "Enable Reliable Internet Stream Transport (RIST)"
  option "with-librsvg", "Enable SVG files as inputs via librsvg"
  option "with-libsoxr", "Enable SoX Resampler library"
  option "with-libssh", "Enable SFTP protocol via libssh"
  option "with-libvidstab", "Enable vid.stab, a video stabilisation library"
  option "with-libvmaf", "Enable libvmaf scoring library"
  option "with-libxml2", "Enable libxml2 library for parsing XML documents"
  option "with-libzvbi", "Enable decoding of DVB teletext pages and DVB teletext subtitles"
  option "with-opencore-amr", "Enable Opencore AMR NR/WB audio format"
  option "with-openh264", "Enable OpenH264 library"
  option "with-openjpeg", "Enable OpenJPEG, the reference implementation of JPEG 2000"
  option "with-openssl", "Enable SSL"
  option "with-openvino", "Enable OpenVINO as a DNN module backend"
  option "with-rav1e", "Enable AV1 encoding via librav1e"
  option "with-rtmpdump", "Enable RTMP dumping"
  option "with-rubberband", "Enable Rubber Band library"
  option "with-speex", "Enable an audio codec designed for speech"
  option "with-srt", "Enable Secure Reliable Transport (SRT)"
  option "with-svt-av1", "Enable Scalable Video Technology for AV1"
  option "with-two-lame", "Enable TwoLAME, an optimised MPEG Audio Layer 2 (MP2) encoder"
  option "with-tesseract", "Enable the Tesseract OCR engine"
  option "with-webp", "Enable libwebp to encode and decode images in WebP format"
  option "with-xvid", "Enable Xvid"
  option "with-zeromq", "Enable libzeromq to receive commands sent through a libzeromq client"
  option "with-zimg", "Enable zimg for scaling, colorspace conversion and dithering"

  depends_on "pkg-config" => :build

  depends_on "aom" => :recommended
  depends_on "dav1d" => :recommended
  depends_on "fontconfig" => :recommended
  depends_on "freetype" => :recommended
  depends_on "harfbuzz" => :recommended
  depends_on "lame" => :recommended
  depends_on "libass" => :recommended
  depends_on "libvorbis" => :recommended
  depends_on "libvpx" => :recommended
  depends_on "libx11" => :recommended
  depends_on "libxcb" => :recommended
  depends_on "opus" => :recommended
  depends_on "sdl2" => :recommended
  depends_on "snappy" => :recommended
  depends_on "theora" => :recommended
  depends_on "x264" => :recommended
  depends_on "x265" => :recommended
  depends_on "xz" => :recommended

  depends_on "aribb24" => :optional
  depends_on "chromaprint" => :optional
  depends_on "fdk-aac" => :optional
  depends_on "frei0r" => :optional
  depends_on "game-music-emu" => :optional
  depends_on "jack" => :optional
  depends_on "jpeg-xl" => :optional
  depends_on "libaribcaption" => :optional
  depends_on "libbluray" => :optional
  depends_on "libbs2b" => :optional
  depends_on "libcaca" => :optional
  depends_on "libdvdnav" => :optional
  depends_on "libdvdread" => :optional
  depends_on "libgsm" => :optional
  depends_on "libmodplug" => :optional
  depends_on "libopenmpt" => :optional
  depends_on "libplacebo" => :optional
  depends_on "librist" => :optional
  depends_on "librsvg" => :optional
  depends_on "libsoxr" => :optional
  depends_on "libssh" => :optional
  depends_on "libvidstab" => :optional
  depends_on "libvmaf" => :optional
  depends_on "libxml2" => :optional
  depends_on "opencore-amr" => :optional
  depends_on "openh264" => :optional
  depends_on "openjpeg" => :optional
  depends_on "openssl" => :optional
  depends_on "openvino" => :optional
  depends_on "rav1e" => :optional
  depends_on "rtmpdump" => :optional
  depends_on "rubberband" => :optional
  depends_on "speex" => :optional
  depends_on "srt" => :optional
  depends_on "svt-av1" => :optional
  depends_on "tesseract" => :optional
  depends_on "two-lame" => :optional
  depends_on "webp" => :optional
  depends_on "xvid" => :optional
  depends_on "zeromq" => :optional
  depends_on "zimg" => :optional

  uses_from_macos "bzip2"
  uses_from_macos "zlib"

  uses_from_macos "libxml2" => :optional

  on_macos do
    depends_on "libarchive"
    depends_on "libogg"
    depends_on "libsamplerate"
  end

  on_linux do
    depends_on "alsa-lib"
    depends_on "libdrm"
    depends_on "libxext"
    depends_on "libxv"
  end

  on_intel do
    depends_on "nasm" => :build
  end

  fails_with gcc: "5"

  # Fix for QtWebEngine, do not remove
  # https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=270209
  patch do
    url "https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/5670ccd86d3b816f49ebc18cab878125eca2f81f/add-av_stream_get_first_dts-for-chromium.patch"
    sha256 "57e26caced5a1382cb639235f9555fc50e45e7bf8333f7c9ae3d49b3241d3f77"
  end

  def install
    ohai "Installing FFmpeg with options..."

    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --enable-pthreads
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --enable-demuxer=dash
      --enable-gpl
      --enable-libaom
      --enable-libdav1d
      --enable-libharfbuzz
      --enable-libmp3lame
      --enable-libopus
      --enable-libsnappy
      --enable-libtheora
      --enable-libvorbis
      --enable-libvpx
      --enable-libx264
      --enable-libx265
      --enable-libfontconfig
      --enable-libfreetype
      --enable-libass
      --disable-htmlpages
      --extra-version=AVpres
    ]

    if OS.mac?
      args << "--enable-opencl"
      args << "--enable-audiotoolbox"
      args << "--enable-videotoolbox"
      args << "--enable-neon" if Hardware::CPU.arm?
    end

    args << "--enable-chromaprint" if build.with? "chromaprint"
    if build.with? "decklink"
      args << "--enable-nonfree"
      args << "--enable-decklink"
      args << "--extra-cflags=-I#{HOMEBREW_PREFIX}/include"
      args << "--extra-ldflags=-L#{HOMEBREW_PREFIX}/include"
      mv "VERSION", "VERSION.txt"
    end
    if build.with? "dvd"
      args << "--enable-libdvdnav"
      args << "--enable-libdvdread"
    end
    if build.with? "fdk-aac"
      args << "--enable-nonfree"
      args << "--enable-libfdk-aac"
    end
    args << "--enable-libflite" if build.with? "libflite"
    args << "--enable-libgme" if build.with? "game-music-emu"
    if build.with? "jack"
      ENV.prepend_path "PKG_CONFIG_PATH", Formula["jack"].opt_lib/"pkgconfig"
      args << "--enable-libjack"
      args << "--enable-indev=jack"
    end
    args << "--enable-libjxl" if build.with? "jpeg-xl"
    args << "--enable-libaribb24" if build.with? "aribb24"
    args << "--enable-libaribcaption" if build.with? "aribcaption"
    args << "--enable-libbluray" if build.with? "bluray"
    args << "--enable-libbs2b" if build.with? "bs2b"
    args << "--enable-libcaca" if build.with? "libcaca"
    args << "--enable-frei0r" if build.with? "frei0r"
    args << "--enable-libgsm" if build.with? "libgsm"
    args << "--enable-libmodplug" if build.with? "libmodplug"
    args << "--enable-libopenmpt" if build.with? "libopenmpt"
    args << "--enable-libsoxr" if build.with? "libsoxr"
    args << "--enable-libssh" if build.with? "libssh"
    args << "--enable-librist" if build.with? "librist"
    args << "--enable-librsvg" if build.with? "librsvg"
    args << "--enable-libvidstab" if build.with? "libvidstab"
    if build.with? "libvmaf"
      args << "--enable-version3"
      args << "--enable-libvmaf"
    end
    if build.with? "opencore-amr"
      args << "--enable-version3"
      args << "--enable-libopencore-amrnb"
      args << "--enable-libopencore-amrwb"
    end
    args << "--enable-libopenh264" if build.with? "openh264"
    args << "--enable-libopenjpeg" if build.with? "openjpeg"
    args << "--enable-libopenvino" if build.with? "openvino"
    if build.with? "libplacebo"
      ENV.prepend_path "PKG_CONFIG_PATH", Formula["libplacebo"].opt_lib/"pkgconfig"
      args << "--enable-libplacebo"
      args << "--enable-vulkan"
    end
    args << "--enable-librav1e" if build.with? "rav1e"
    args << "--enable-librtmp" if build.with? "rtmpdump"
    args << "--enable-librubberband" if build.with? "rubberband"
    args << "--enable-libspeex" if build.with? "speex"
    args << "--enable-libsrt" if build.with? "srt"
    args << "--enable-libsvtav1" if build.with? "svt-av1"
    args << "--enable-libtesseract" if build.with? "tesseract"
    args << "--enable-libtwolame" if build.with? "two-lame"
    if build.with? "openssl"
      args << "--enable-nonfree"
      args << "--enable-openssl"
    end
    args << "--enable-libwebp" if build.with? "webp"
    args << "--enable-libxml2" if build.with? "libxml2"
    args << "--enable-libxvid" if build.with? "xvid"
    args << "--enable-libzimg" if build.with? "zimg"
    args << "--enable-libzmq" if build.with? "zeromq"
    if build.with? "zvbi"
      ENV.prepend_path "PKG_CONFIG_PATH", Formula["zvbi"].opt_lib/"pkgconfig"
      args << "--enable-libzvbi"
    end

    system "./configure", *args
    system "make", "install"
    system "make", "alltools"
    bin.install (buildpath/"tools").children.select { |f| f.file? && f.executable? }
    pkgshare.install buildpath/"tools/python"
  end

  test do
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg", "-filter_complex", "testsrc=rate=1:duration=1", mp4out
    assert_predicate mp4out, :exist?
  end
end
