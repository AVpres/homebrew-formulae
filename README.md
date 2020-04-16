# Brew Formulae for Audio-Visual Preservation

## Maintained Formulae

- **cineform** – Alternate static and shared CineForm libraries: `libcineform.a`, as well as `libcineform.so` under Linux or `libcineform.dylib` under macOS
- **cineform-gopro** – GoPro’s static CineForm library: `libCFHDCodec.a`
- **cpio** – Copy files to and from archives
- **ffmpeg** – Alternate FFmpeg formula with options
- **gcobol** - GNU COBOL (includes `--devel` option)
- **gprolog** – Prolog top-level (GNU Prolog)

Full installation requires to log into our [extranet](https://reto.ch/cgi-bin/login.pl) before running the following formulae:

- the **MovIm** package contains the _libmovim_ C library, implementing the _MovIm_ video codec, and its associated _movimenc_, _movimdec_ and _movimplay_ utilities, as well as the _openmovim_ Bash command-line interface to encode, decode, play and analyse virtually any moving images
- the **openLTFS** package includes the _libltfs_ C library and its associated _ltfs_, _ltfsck_, _ltfscp_ and _mkltfs_ utilities, as well as the _openltfs_ Bash command-line interface
- the **openLTO** package is a collection of Bash scripts to manage LTO cartridges with LTFS
- the **Spoiled\_Apples** package emulates 6502, 680x0 and PowerPC−based Apple computers
- **vrecord-x** is a [_vrecord_](https://github.com/amiaopensource/vrecord) flavour running on Linux, macOS and Windows – reactivated for training purposes

## Experimental Formulae

Please do not install the following formula unless you know exactly what you are doing:

- **hla** – High Level Assembler (HLABE back end, LD linker)

## Renamed Formula

The **openMovIm** package has been renamed **MovIm** on 2019-05-04.

## Deleted Formulae

The following formula has been deleted from this GitHub repository on 2019-02-29:

- **vrecord-x** is a [_vrecord_](https://github.com/amiaopensource/vrecord) flavour running on Linux, macOS and Windows

After one year and a half, the official formula by AMIA Open Source has added Linux support, as well as HuffYUV and ProRes 422 HQ encodings. Therefore this alternate one was no longer needed.

QuickJS is now available as a regular Homebrew formula (`quickjs`) and we have deleted our formula on 2019-08-03:

- **quickjs** – QuickJS Javascript Engine

The development of _libycocg_ and _libmsmi_ has been stopped and on 2019-01-12 and these libraries are superseded by _libmovim_. The two associated formulae have been deleted from this GitHub repository on 2019-03-02:

- the **openMSMI** package contains the _libmsmi_ C library, implementing the _MSMI_ video codec for multispectral moving images, and the _openmsmi_ Bash command-line interface to _libmsmi_, allowing to encode, decode, play and analyse multispectral moving images
- the **openYCoCg** package contains the _libycocg_ C library, implementing the _YCoCg_ video codec, and the _openycocg_ Bash command−line interface, allowing to encode, decode, play and analyse Y′C<sub>O</sub>C<sub>G</sub> video files

## Copyright, Licence and Disclaimer

Copyright © 2017–2020 by Reto Kromer

These formulae are released under a [3-Clause BSD License](LICENSE).

These formulae are provided “as is” without warranty or support of any kind.
