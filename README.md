# Brew Formulae for Audio-Visual Preservation

## Maintained Formulae

- **gprolog** - Prolog top-level (GNU Prolog)

Full installation requires to log into our [extranet](https://reto.ch/cgi-bin/login.pl) before running the following formulae:

- the **MovIm** package contains the _libmovim_ C library, implementing the _MovIm_ video codec, and its associated _movimenc_, _movimdec_ and _movimplay_ utilities, as well as the _openmovim_ Bash command-line interface to encode, decode, play and analyse virtually any moving images;
- the **openLTFS** package includes the _libltfs_ C library and its associated _ltfs_, _mkltfs_ and _chkltfs_ utilities, as well as the _openltfs_ Bash command-line interface;
- the **openLTO** package is a collection of Bash scripts to manage LTO cartridges with LTFS;
- the **Spoiled\_Apples** package allows the emulation of 6502, 680x0 and PowerPC−based Apple computers.

During the development, it’s necessary to be connected to our [extranet](https://reto.ch/cgi-bin/login.pl) before running the following formula, otherwise the patch will not be applied:

- **vrecord-x** is a [_vrecord_](https://github.com/amiaopensource/vrecord) flavour running on Linux (including on Windows) and on macOS.

The official formula by AMIA Open Source is getting closer and closer to our alternate one. Currently the only remaining substantial modification is that [HuffYUV encoding](https://github.com/amiaopensource/vrecord/issues/366) is added, because it’s 25% faster than FFV1 encoding. Therefore most probably our alternate formula can disappear again very soon.

## Experimental Formulae

- **cineform** – static CineForm codec library (`libCFHDCodec.a` to be included in other applications ;-)

Please do not install the following formula unless you know exactly what you are doing:

- **hla** – High Level Assembler (HLABE back end, LD linker)

## Renamed Formula

The **openMovIm** package has been renamed **MovIm** on 2019–05–04.

## Deleted Formulae

The development of _libycocg_ and _libmsmi_ has been stopped and on 2019–01–12 and these libraries are superseded by _libmovim_. The two associated formulae have been deleted from this GitHub repository on 2019–03–02:

- the **openMSMI** package contains the _libmsmi_ C library, implementing the _MSMI_ video codec for multispectral moving images, and the _openmsmi_ Bash command-line interface to _libmsmi_, allowing to encode, decode, play and analyse multispectral moving images;
- the **openYCoCg** package contains the _libycocg_ C library, implementing the _YCoCg_ video codec, and the _openycocg_ Bash command−line interface, allowing to encode, decode, play and analyse Y′C<sub>O</sub>C<sub>G</sub> video files.

## Copyright, Licence and Disclaimer

Copyright © 2017–2019 by Reto Kromer

These formulae are released under a [3-Clause BSD License](https://opensource.org/licenses/BSD-3-Clause).

These formulae are provided «as is» without warranty or support of any kind.
