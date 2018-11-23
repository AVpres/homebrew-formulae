# Brew Formulae for AV Preservation

## Table of Contents

During the software development, it’s necessary to be connected to our [extranet](https://reto.ch/cgi-bin/login.pl) before running the following formulae, otherwise all but the libraries will be installed.

- the **openLTFS** package includes the _ltfs_ C library and the _openltfs_ Bash command-line tool;
- the **openLTO** package is a collection of Bash scripts to manage LTO cartridges with LTFS;
- the **openMSMI** package contains the _libmsmi_ C library, implementing the _MSMI_ video codec for multispectral moving images, and the _openmsmi_ Bash command-line interface to _libmsmi_, allowing to encode, decode, play and analyse multispectral moving images;
- the **openYCoCg** package contains the _libycocg_ C library, implementing the _YCoCg_ video codec, and the _openycocg_ Bash command−line interface to _libycocg_, allowing to encode, decode, play and analyse Y′C<sub>O</sub>C<sub>G</sub> video files.

The following formula is provided as long as the AMIA Open Source’s GitHub repository does not make available the current release of QCTools, but only an old one:
  - **qctools-x**

## Experimental Formulae

Please do not install the following formulae unless you know exactly what you are doing. (For example: on macOS the current **cpio** will replace the older version provided by Apple.)

- **cpio** – Copy files to and from archives, with optional:
  - **mt** – Control magnetic tape drive operation
- **hla** – High Level Assembler (HLABE back end, LD linker)

During the development, it’s necessary to be connected to our [extranet](https://reto.ch/cgi-bin/login.pl) before running the formula, otherwise the patch will not be applied:

- **vrecord-x** is a [_vrecord_](https://github.com/amiaopensource/vrecord) flavour running on Linux (including as a Windows’ app) and on macOS. The main modifications made are:
  - the GUI is removed, because _Pashua_ is not platform independent, and only the CLI is currently used;
  - the HuffYUV encoding is added, because it’s 25% faster than FFV1 encoding;
  - ProRes 422 HQ is used, because the quality is higher than the default ProRes 422 standard.

## Copyright, Licence and Disclaimer

Copyright © 2017–2018 by Reto Kromer

These formulae are released under a [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) Licence.

These formulae are provided «as is» without warranty or support of any kind.
