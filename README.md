# homebrew-anylut

Homebrew tap for [`anylut`](https://github.com/hisea/anylut-cli), a command-line
tool for non-destructive photo edits.

```bash
brew install hisea/anylut/anylut
```

Apple Silicon, macOS 14 or later. The formula downloads a signed and notarized
prebuilt binary from the [anylut-cli releases](https://github.com/hisea/anylut-cli/releases).

Homebrew asks you to trust non-official taps. The command above names the formula
in full, which trusts just that one formula. If you `brew tap hisea/anylut` first
and want to install by the short name, trust it explicitly:

```bash
brew tap hisea/anylut
brew trust --formula hisea/anylut/anylut
brew install anylut
```
