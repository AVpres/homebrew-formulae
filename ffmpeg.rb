class Ffmpeg < Formula
  desc "Alternate FFmpeg formula with options"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-4.4.1.tar.xz"
  sha256 "eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02"
  license "GPL-2.0-or-later"
  revision 2
  head "https://github.com/FFmpeg/FFmpeg.git"

  option "with-chromaprint", "Enable the Chromaprint audio fingerprinting library"
  option "with-decklink", "Enable DeckLink support"
  option "with-fdk-aac", "Enable the Fraunhofer FDK AAC library"
  option "with-game-music-emu", "Enable Game Music Emu (GME) support"
  option "with-jack", "Enable Jack support"
  option "with-librist", "Enable Reliable Internet Stream Transport (RIST) support"
  option "with-librsvg", "Enable SVG files as inputs via librsvg"
  option "with-libsoxr", "Enable the soxr resample library"
  option "with-libssh", "Enable SFTP protocol via libssh"
  option "with-libvidstab", "Enable vid.stab support for video stabilization"
  option "with-libvmaf", "Enable libvmaf scoring library"
  option "with-libxml2", "Enable libxml2 library"
  option "with-opencore-amr", "Enable Opencore AMR NR/WB audio format"
  option "with-openh264", "Enable OpenH264 library"
  option "with-openjpeg", "Enable JPEG 2000 image format"
  option "with-openssl", "Enable SSL support"
  option "with-rav1e", "Enable AV1 encoding via librav1e"
  option "with-rtmpdump", "Enable RTMP dumping support"
  option "with-rubberband", "Enable rubberband library"
  option "with-srt", "Enable SRT library"
  option "with-tesseract", "Enable the tesseract OCR engine"
  option "with-webp", "Enable using libwebp to encode WEBP images"
  option "with-zeromq", "Enable using libzeromq to receive cmds sent through a libzeromq client"
  option "with-zimg", "Enable z.lib zimg library"

  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  depends_on "texinfo" => :build

  depends_on "aom"
  depends_on "dav1d"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "frei0r"
  depends_on "lame"
  depends_on "libass"
  depends_on "libvorbis"
  depends_on "libvpx"
  depends_on "opus"
  depends_on "sdl2"
  depends_on "snappy"
  depends_on "theora"
  depends_on "x264"
  depends_on "x265"
  depends_on "xz"

  depends_on "fdk-aac" => :optional
  depends_on "game-music-emu" => :optional
  depends_on "jack" => :optional
  depends_on "libbluray" => :optional
  depends_on "libbs2b" => :optional
  depends_on "libcaca" => :optional
  depends_on "libgsm" => :optional
  depends_on "libmodplug" => :optional
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
  depends_on "rav1e" => :optional
  depends_on "rtmpdump" => :optional
  depends_on "rubberband" => :optional
  depends_on "speex" => :optional
  depends_on "srt" => :optional
  depends_on "tesseract" => :optional
  depends_on "two-lame" => :optional
  depends_on "webp" => :optional
  depends_on "xvid" => :optional
  depends_on "zeromq" => :optional
  depends_on "zimg" => :optional

  uses_from_macos "bzip2"
  uses_from_macos "zlib"

  on_linux do
    depends_on "libxv"
  end

  def install
    ohai "Installing FFmpeg with options..."

    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --enable-demuxer=dash
      --enable-gpl
      --enable-libaom
      --enable-libdav1d
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
      --enable-frei0r
      --enable-libass
      --disable-htmlpages
      --extra-version=with-options
    ]

    if OS.mac?
      args << "--enable-opencl"
      args << "--enable-videotoolbox"
    end

    args << "--enable-chromaprint" if build.with? "chromaprint"
    if build.with? "decklink"
      args << "--enable-nonfree"
      args << "--enable-decklink"
      args << "--extra-cflags=-I#{HOMEBREW_PREFIX}/include"
      args << "--extra-ldflags=-L#{HOMEBREW_PREFIX}/include"
      patch :DATA
    end
    if build.with? "fdk-aac"
      args << "--enable-nonfree"
      args << "--enable-libfdk-aac"
    end
    args << "--enable-libgme" if build.with? "game-music-emu"
    if build.with? "jack"
      ENV.prepend_path "PKG_CONFIG_PATH", Formula["jack"].opt_lib/"pkgconfig"
      args << "--enable-libjack"
      args << "--enable-indev=jack"
    end
    args << "--enable-libbluray" if build.with? "libbluray"
    args << "--enable-libbs2b" if build.with? "libbs2b"
    args << "--enable-libcaca" if build.with? "libcaca"
    args << "--enable-libgsm" if build.with? "libgsm"
    args << "--enable-libmodplug" if build.with? "libmodplug"
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
    args << "--enable-librav1e" if build.with? "rav1e"
    args << "--enable-librtmp" if build.with? "rtmpdump"
    args << "--enable-librubberband" if build.with? "rubberband"
    args << "--enable-libspeex" if build.with? "speex"
    args << "--enable-libsrt" if build.with? "srt"
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

    system "./configure", *args
    system "make", "install"
    system "make", "alltools"
    bin.install Dir["tools/*"].select { |f| File.executable? f }
    mv bin/"python", pkgshare/"python", force: true
  end

  test do
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg", "-filter_complex", "testsrc=rate=1:duration=1", mp4out
    assert_predicate mp4out, :exist?
  end
end

__END__
Signed-off-by: Paul B Mahol <onemda@gmail.com>
---
fftools/ffmpeg.c                |   5 +
fftools/ffmpeg.h                |   1 +
fftools/ffmpeg_opt.c            |   1 +
tests/ref/fate/adpcm-ima-smjpeg | 658 ++++++++++++++++----------------
tests/ref/fate/dcinema-encode   |  26 +-
tests/ref/lavf/smjpeg           |   2 +-
6 files changed, 350 insertions(+), 343 deletions(-)

diff --git a/fftools/ffmpeg.c b/fftools/ffmpeg.c
index b0ce7c7c32..bde36dbb12 100644
--- a/fftools/ffmpeg.c
+++ b/fftools/ffmpeg.c
@@ -2382,6 +2382,11 @@ static int decode_audio(InputStream *ist, AVPacket *pkt, int *got_output,
         decoded_frame->pts = ist->dts;
         decoded_frame_tb   = AV_TIME_BASE_Q;
     }
+    if (pkt && pkt->duration && ist->prev_pkt_pts != AV_NOPTS_VALUE &&
+        pkt->pts != AV_NOPTS_VALUE && pkt->pts - ist->prev_pkt_pts > pkt->duration)
+        ist->filter_in_rescale_delta_last = 0;
+    if (pkt)
+        ist->prev_pkt_pts = pkt->pts;
     if (decoded_frame->pts != AV_NOPTS_VALUE)
         decoded_frame->pts = av_rescale_delta(decoded_frame_tb, decoded_frame->pts,
                                               (AVRational){1, avctx->sample_rate}, decoded_frame->nb_samples, &ist->filter_in_rescale_delta_last,
diff --git a/fftools/ffmpeg.h b/fftools/ffmpeg.h
index d2dd7ca092..6657773d32 100644
--- a/fftools/ffmpeg.h
+++ b/fftools/ffmpeg.h
@@ -313,6 +313,7 @@ typedef struct InputStream {
     AVFrame *filter_frame; /* a ref of decoded_frame, to be sent to filters */
     AVPacket *pkt;

+    int64_t       prev_pkt_pts;
     int64_t       start;     /* time when read started */
     /* predicted dts of the next packet read for this stream or (when there are
      * several frames in a packet) of the next frame in current packet (in AV_TIME_BASE units) */
diff --git a/fftools/ffmpeg_opt.c b/fftools/ffmpeg_opt.c
index 428934a3d8..a7d35b1ee2 100644
--- a/fftools/ffmpeg_opt.c
+++ b/fftools/ffmpeg_opt.c
@@ -867,6 +867,7 @@ static void add_input_streams(OptionsContext *o, AVFormatContext *ic)
         }

         ist->filter_in_rescale_delta_last = AV_NOPTS_VALUE;
+        ist->prev_pkt_pts = AV_NOPTS_VALUE;

         ist->dec_ctx = avcodec_alloc_context3(ist->dec);
         if (!ist->dec_ctx) {
-- 
2.17.1
-- 
X-Git-Url: http://git.ffmpeg.org/gitweb/ffmpeg.git/blobdiff_plain/7539a01bb0ea24998e1aa87706edf9785ddd3ac6..57aaeff523ec45039c564765673c998ee900d4f9:/libavformat/dv.c

diff --git a/libavformat/dv.c b/libavformat/dv.c
index cbb38cbd7d..d7909683c3 100644
--- a/libavformat/dv.c
+++ b/libavformat/dv.c
@@ -40,12 +40,22 @@
 #include "dv.h"
 #include "libavutil/avassert.h"
 
+// Must be kept in sync with AVPacket
+struct DVPacket {
+    int64_t  pts;
+    uint8_t *data;
+    int      size;
+    int      stream_index;
+    int      flags;
+    int64_t  pos;
+};
+
 struct DVDemuxContext {
     const AVDVProfile*  sys;    /* Current DV profile. E.g.: 525/60, 625/50 */
     AVFormatContext*  fctx;
     AVStream*         vst;
     AVStream*         ast[4];
-    AVPacket          audio_pkt[4];
+    struct DVPacket   audio_pkt[4];
     uint8_t           audio_buf[4][8192];
     int               ach;
     int               frames;
@@ -261,11 +271,12 @@ static int dv_extract_audio_info(DVDemuxContext *c, const uint8_t *frame)
             c->ast[i]->codecpar->codec_type = AVMEDIA_TYPE_AUDIO;
             c->ast[i]->codecpar->codec_id   = AV_CODEC_ID_PCM_S16LE;
 
-            av_init_packet(&c->audio_pkt[i]);
             c->audio_pkt[i].size         = 0;
             c->audio_pkt[i].data         = c->audio_buf[i];
             c->audio_pkt[i].stream_index = c->ast[i]->index;
             c->audio_pkt[i].flags       |= AV_PKT_FLAG_KEY;
+            c->audio_pkt[i].pts          = AV_NOPTS_VALUE;
+            c->audio_pkt[i].pos          = -1;
         }
         c->ast[i]->codecpar->sample_rate    = dv_audio_frequency[freq];
         c->ast[i]->codecpar->channels       = 2;
@@ -358,7 +369,13 @@ int avpriv_dv_get_packet(DVDemuxContext *c, AVPacket *pkt)
 
     for (i = 0; i < c->ach; i++) {
         if (c->ast[i] && c->audio_pkt[i].size) {
-            *pkt                 = c->audio_pkt[i];
+            pkt->size         = c->audio_pkt[i].size;
+            pkt->data         = c->audio_pkt[i].data;
+            pkt->stream_index = c->audio_pkt[i].stream_index;
+            pkt->flags        = c->audio_pkt[i].flags;
+            pkt->pts          = c->audio_pkt[i].pts;
+            pkt->pos          = c->audio_pkt[i].pos;
+
             c->audio_pkt[i].size = 0;
             size                 = pkt->size;
             break;
@@ -404,7 +421,6 @@ int avpriv_dv_produce_packet(DVDemuxContext *c, AVPacket *pkt,
 
     /* Now it's time to return video packet */
     size = dv_extract_video_info(c, buf);
-    av_init_packet(pkt);
     pkt->data         = buf;
     pkt->pos          = pos;
     pkt->size         = size;
-- 
Signed-off-by: Paul B Mahol <onemda@gmail.com>
---
libavformat/dv.c | 4 ++++
1 file changed, 4 insertions(+)

diff --git a/libavformat/dv.c b/libavformat/dv.c
index d7909683c3..b2b74162df 100644
--- a/libavformat/dv.c
+++ b/libavformat/dv.c
@@ -48,6 +48,7 @@ struct DVPacket {
     int      stream_index;
     int      flags;
     int64_t  pos;
+    int64_t  duration;
 };
 
 struct DVDemuxContext {
@@ -276,6 +277,7 @@ static int dv_extract_audio_info(DVDemuxContext *c, const uint8_t *frame)
             c->audio_pkt[i].stream_index = c->ast[i]->index;
             c->audio_pkt[i].flags       |= AV_PKT_FLAG_KEY;
             c->audio_pkt[i].pts          = AV_NOPTS_VALUE;
+            c->audio_pkt[i].duration     = 0;
             c->audio_pkt[i].pos          = -1;
         }
         c->ast[i]->codecpar->sample_rate    = dv_audio_frequency[freq];
@@ -374,6 +376,7 @@ int avpriv_dv_get_packet(DVDemuxContext *c, AVPacket *pkt)
             pkt->stream_index = c->audio_pkt[i].stream_index;
             pkt->flags        = c->audio_pkt[i].flags;
             pkt->pts          = c->audio_pkt[i].pts;
+            pkt->duration     = c->audio_pkt[i].duration;
             pkt->pos          = c->audio_pkt[i].pos;
 
             c->audio_pkt[i].size = 0;
@@ -404,6 +407,7 @@ int avpriv_dv_produce_packet(DVDemuxContext *c, AVPacket *pkt,
         c->audio_pkt[i].pos  = pos;
         c->audio_pkt[i].size = size;
         c->audio_pkt[i].pts  = (c->sys->height == 720) ? (c->frames & ~1) : c->frames;
+        c->audio_pkt[i].duration = 1;
         ppcm[i] = c->audio_buf[i];
     }
     if (c->ach)
-- 
2.17.1
