# Brew Formulae for AV Preservation

## Table of Contents

During the software development, it’s necessary to be connected to our [extranet](https://reto.ch/cgi-bin/login.pl) before running the following formulae, otherwise all but the libraries will be installed:

- the **openLTFS** package includes the _ltfs_ C library and the _openltfs_ Bash command-line tool;
- the **openLTO** package is a collection of Bash scripts to manage LTO cartridges with LTFS;
- the **openYCoCg** package contains the _libycocg_ C library, implementing the _YCoCg_ video codec, and the _openycocg_ Bash command−line interface to _libycocg_, allowing to encode, decode, play and analyse Y′C<sub>O</sub>C<sub>G</sub> video files;

- the **vrecord-x** package is a [_vrecord_](https://github.com/amiaopensource/vrecord) flavour running on Linux (incl. Windows Subsystem) and macOS, essentially without the graphical user interface, because Pashua is not platform independent.

## Experimental Formulae

Please do not install the following formulae unless you know exactly what you are doing.

- **cpio** – Copy files to and from archives, with optional
- **mt** – Control magnetic tape drive operation

- **hla** – High Level Assembler (HLABE back end, LD linker)

## Copyright, Licence and Disclaimer

Copyright © 2017–2018 by Reto Kromer

These formulae are released under a [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) Licence.

These formulae are provided «as is» without warranty or support of any kind.
