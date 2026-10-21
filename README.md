# homebrew-tap

Homebrew tap for tools by hisea.

## anylut

[`anylut`](https://github.com/hisea/anylut-cli) is a command-line tool for non-destructive photo edits.

```bash
brew install hisea/tap/anylut
```

Apple Silicon, macOS 14 or later. The formula downloads a signed and notarized prebuilt binary from the [anylut-cli releases](https://github.com/hisea/anylut-cli/releases).

Homebrew asks you to trust non-official taps. Naming a formula in full (`brew install hisea/tap/<formula>`) trusts that one formula. After `brew tap hisea/tap`, installing by the short name needs `brew trust --formula hisea/tap/<formula>` first. Example:

```bash
brew tap hisea/tap
brew trust --formula hisea/tap/anylut
brew install anylut
```

Note for users of the old name: `hisea/anylut` keeps working through the GitHub redirect; to move to the new name run `brew untap --force hisea/anylut && brew tap hisea/tap`.
