# Brew Formulae for Audiovisual Preservation

## Maintained Formulae

- **bash-avpres** – Bash scripts for audiovisual preservation
- **cineform** – Alternate static and shared CineForm libraries: `libcineform.a`, as well as `libcineform.so` under Linux or `libcineform.dylib` under macOS
- **cineform-gopro** – GoPro’s static CineForm library: `libCFHDCodec.a`
- **ffcommand-engine** – Instals the FFCommand\_Engine app by Colorlab<br>Attention: Use the `--HEAD` flag to install the not officially released version 0.6 rather than the current version 0.51 for macOS (and 0.5 for Windows).
- **ffmpeg** – Alternate FFmpeg formula with options:<br>`brew options avpres/formulae/ffmpeg`

We will likely be removing both CineForm formulae soon, as the resources no longer appear to be maintained.

Full installation requires to log into our [extranet](https://reto.ch/cgi-bin/login) before running the following formulae:

- the **MovIm** package contains the _libmovim_ C library, implementing the _MovIm_ video codec, and its associated _movimenc_, _movimdec_ and _movimplay_ utilities, as well as the _openmovim_ Bash command-line interface to encode, decode, play and analyse virtually any moving images
- the **openLTFS** package includes the _libltfs_ C library and its associated _ltfs_, _ltfs\_check_, _ltfs\_copy_ and _mkltfs_ utilities, as well as the _openltfs_ Bash command-line interface
- the **openLTO** package is a collection of Bash scripts to manage LTO cartridges with LTFS
- the **Spoiled\_Apples** package emulates 6502, 680x0 and PowerPC−based Apple computers and clones

## Renamed Formula

The **openMovIm** package has been renamed **MovIm** on 2019-05-04.

## Deleted Formulae

As Prolog is now a available as regular Homebrew formula (`gnu-prolog`), we have deleted our formula on 2021-07-21:

- **gprolog** – Prolog top-level (GNU Prolog)

The following formulae have been deleted from this GitHub repository:

- **cpio** – Copy files to and from archives

Under Linux also instals: **mt** – Control magnetic tape drive operation.

- **hla** – High Level Assembler (HLABE back end, LD linker)

- **vrecord-x** is a [_vrecord_](https://github.com/amiaopensource/vrecord) flavour running on Linux, macOS and Windows

After two years, the official formula by the AMIA Open Source Committee added Linux support, as well as HuffYUV and ProRes 422 HQ encodings. Therefore this alternate one was no longer needed.

As the regular Homebrew formula (`gnu-cobol`) is now again up to date, we have deleted our formula on 2020-12-19:

- **gcobol** – GNU COBOL (includes `--HEAD` option which installs the version 3.1 RC 1)

As QuickJS is now available as a regular Homebrew formula (`quickjs`), we have deleted our formula on 2019-08-03:

- **quickjs** – QuickJS Javascript Engine

The development of _libycocg_ and _libmsmi_ has been stopped and on 2019-01-12 and these libraries are superseded by _libmovim_. The two associated formulae have been deleted from this GitHub repository on 2019-03-02:

- the **openMSMI** package contains the _libmsmi_ C library, implementing the _MSMI_ video codec for multispectral moving images, and the _openmsmi_ Bash command-line interface to _libmsmi_, allowing to encode, decode, play and analyse multispectral moving images
- the **openYCoCg** package contains the _libycocg_ C library, implementing the _YCoCg_ video codec, and the _openycocg_ Bash command−line interface, allowing to encode, decode, play and analyse Y′C<sub>O</sub>C<sub>G</sub> video files

## Copyright, Licence and Disclaimer

Copyright © 2017–2024 by Reto Kromer

These formulae are released under a [3-Clause BSD License](LICENSE) and are provided “as is” without warranty or support of any kind.
