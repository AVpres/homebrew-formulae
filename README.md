# Brew Formulae for Audiovisual Preservation

Before installing the first formula, run:
```
brew tap avpres/formulae
brew trust avpres/formulae
```

- **bash-avpres** – Bash scripts for audiovisual preservation<br>
`brew install bash-avpres`

- **ffmpeg** – Alternative FFmpeg formula with options<br>
`brew options avpres/formulae/ffmpeg`<br>
`brew install <options> avpres/formulae/ffmpeg`

- **mpv** – Media player based on our alternative FFmpeg formula<br>
`brew install avpres/formulae/mpv`<br>
If you need specific options, install `ffmpeg` with those options before installing `mpv`. After the initial installation, you can upgrade the formulae independently.

## Copyright, License and Disclaimer

Copyright © 2017–2026 by Reto Kromer

These formulae are released under a [3-Clause BSD License](LICENSE) and are provided “as is” without warranty or support of any kind.
