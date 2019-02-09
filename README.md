# Brew Formulae for Audio-Visual Preservation

## UPDATE: An FFmpeg Flavour for Archivists

The standard Homebrew distribution of FFmpeg includes again the options needed for some archival work. Therefore we recommend to use again the standard Homebrew distribution. To switch back, please run in the Terminal the following commands:

```
brew uninstall --ignore-dependencies ffmpeg
brew untap avpres/formulae
brew update
brew install ffmpeg
```

and, if and only if you do use other formulae from this repository, then also:

```
brew tap avpres/formulae
```

Yet an again parametrable FFmpeg formula will be available soon… somewhere.

## Maintained Formulae

During the software development, it’s necessary to be connected to our [extranet](https://reto.ch/cgi-bin/login.pl) before running the following formulae, otherwise all but the libraries will be installed.

- the **openLTFS** package includes the _ltfs_ C library and the _openltfs_ Bash command-line tool;
- the **openLTO** package is a collection of Bash scripts to manage LTO cartridges with LTFS;
- the **openMovIm** package contains the _libmovim_ C library, implementing the _MovIm_ video codec and the _openmovim_ Bash command-line interface to _livmovim_, allowing to encode, decode, play and analyse virtually any moving images.

### Experimental Formulae

Please do not install the following formula unless you know exactly what you are doing:

- **hla** – High Level Assembler (HLABE back end, LD linker)

During the development, it’s necessary to be connected to our [extranet](https://reto.ch/cgi-bin/login.pl) before running the formula, otherwise the patch will not be applied:

- **vrecord-x** is a [_vrecord_](https://github.com/amiaopensource/vrecord) flavour running on Linux (including as a Windows’ app) and on macOS.

The official formula by AMIA Open Source is getting closer and closer to our alternate one. Currently the only remaining modifications are:
  - HuffYUV encoding is added, because it’s 25% faster than FFV1 encoding;
  - FLAC encoding is added, because it’s a robust format for archiving.

Therefore most probably our alternate formula can disappear again very soon.

## Abandoned Formulae

The development of _libycocg_ and _libmsmi_ has been stopped and on 2019–01–12 these libraries have been superseded by _libmovim_:

- the **openMSMI** package contains the _libmsmi_ C library, implementing the _MSMI_ video codec for multispectral moving images, and the _openmsmi_ Bash command-line interface to _libmsmi_, allowing to encode, decode, play and analyse multispectral moving images;
- the **openYCoCg** package contains the _libycocg_ C library, implementing the _YCoCg_ video codec, and the _openycocg_ Bash command−line interface to _libycocg_, allowing to encode, decode, play and analyse Y′C<sub>O</sub>C<sub>G</sub> video files.

These two formulae will be cancelled mid March 2019 from this GitHub repository.

## Copyright, Licence and Disclaimer

Copyright © 2017–2019 by Reto Kromer

These formulae are released under a [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) Licence.

These formulae are provided «as is» without warranty or support of any kind.
