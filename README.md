# Marko — Homebrew tap

A Homebrew tap for [Marko](https://github.com/yash-banka/marko-releases), a fast,
native Markdown viewer for macOS.

## Install

```sh
brew tap yash-banka/marko
brew install --cask marko
```

## Updates

Marko updates itself through Sparkle, so the cask declares `auto_updates true`
and `brew upgrade` deliberately leaves it alone. Use **Marko → Check for
Updates**, or let it check on its own. `brew upgrade --cask --greedy marko`
would also work, but it is never necessary.

## Uninstall

```sh
brew uninstall --cask marko
```

Add `--zap` to remove Marko's preferences and caches as well.
