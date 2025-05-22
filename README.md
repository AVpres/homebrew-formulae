# Brew Formulae for Audiovisual Preservation

## Maintained Formulae

- **bash-avpres** – Bash scripts for audiovisual preservation
- **ffmpeg** – Alternate FFmpeg formula with options:<br>
`brew options avpres/formulae/ffmpeg`

Full installation requires to log into our [extranet](https://reto.ch/cgi-bin/login.pl) before running the following formulae:

- the **MovIm** package contains the _libmovim_ C library, implementing the _MovIm_ video codec, and its associated _movimenc_, _movimdec_ and _movimplay_ utilities, as well as the _openmovim_ Bash command-line interface to encode, decode, play and analyse virtually any moving images
- the **Spoiled\_Apples** package emulates 6502, 680x0 and PowerPC−based Apple computers and clones

## Deleted Formulae

We have removes the formula for FFCommand\_Engine, because this software is no longer maintained upstream.

- **ffcommand-engine** – Instals the FFCommand\_Engine app by Colorlab<br>
Attention: Use the `--HEAD` flag to install the not officially released version 0.6 rather than the current version 0.51 for macOS (and 0.5 for Windows).

We have removed the two formulae for _openLTFS_ and _openLTO_, because abandoned the development of those pieces of software:

- the **openLTFS** package includes the _libltfs_ C library and its associated _ltfs_, _ltfs\_check_, _ltfs\_copy_ and _mkltfs_ utilities, as well as the _openltfs_ Bash command-line interface
- the **openLTO** package is a collection of Bash scripts to manage LTO cartridges with LTFS

We have removed both CineForm formulae on 2024-10-26, as the resources upstream no longer appear to be maintained.

- **cineform** – Alternate static and shared CineForm libraries: `libcineform.a`, as well as `libcineform.so` under Linux or `libcineform.dylib` under macOS
- **cineform-gopro** – GoPro’s static CineForm library: `libCFHDCodec.a`

## Copyright, Licence and Disclaimer

Copyright © 2017–2025 by Reto Kromer

These formulae are released under a [3-Clause BSD License](LICENSE) and are provided “as is” without warranty or support of any kind.
