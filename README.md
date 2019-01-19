# Brew Formulae for AV Preservation

## Table of Contents

During the software development, it’s necessary to be connected to our [extranet](https://reto.ch/cgi-bin/login.pl) before running the following formulae, otherwise all but the libraries will be installed.

- the **openLTFS** package includes the _ltfs_ C library and the _openltfs_ Bash command-line tool;
- the **openLTO** package is a collection of Bash scripts to manage LTO cartridges with LTFS;
- the **openMovIm** package contains the _libmovim_ C library, implementing the _MovIm_ video codec and the _openmovim_ Bash command-line interface to _livmovim_, allowing to encode, decode, play and analyse virtually any moving images.

### Experimental Formulae

Please do not install the following formulae unless you know exactly what you are doing. (For example: on macOS the current **cpio** will replace the older version provided by Apple.)

- **cpio** – Copy files to and from archives, with optional:
  - **mt** – Control magnetic tape drive operation
- **hla** – High Level Assembler (HLABE back end, LD linker)

During the development, it’s necessary to be connected to our [extranet](https://reto.ch/cgi-bin/login.pl) before running the formula, otherwise the patch will not be applied:

- **vrecord-x** is a [_vrecord_](https://github.com/amiaopensource/vrecord) flavour running on Linux (including as a Windows’ app) and on macOS.

The official formula by AMIA Open Source is getting closer and closer to our alternate one. Currently the only remaining modifications are:
  - HuffYUV encoding is added, because it’s 25% faster than FFV1 encoding;
  - FLAC encoding is added, because it’s a robust format for archiving.

Therefore most probably our alternate formula can disappear again very soon.

### Abandoned Formulae

The development of **openYCoCg** and **openMSMI** has been stopped and have been and superseded by **openMovIm** on 2019–01–12:

- the **openMSMI** package contains the _libmsmi_ C library, implementing the _MSMI_ video codec for multispectral moving images, and the _openmsmi_ Bash command-line interface to _libmsmi_, allowing to encode, decode, play and analyse multispectral moving images;
- the **openYCoCg** package contains the _libycocg_ C library, implementing the _YCoCg_ video codec, and the _openycocg_ Bash command−line interface to _libycocg_, allowing to encode, decode, play and analyse Y′C<sub>O</sub>C<sub>G</sub> video files.

## Copyright, Licence and Disclaimer

Copyright © 2017–2019 by Reto Kromer

These formulae are released under a [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) Licence.

These formulae are provided «as is» without warranty or support of any kind.
