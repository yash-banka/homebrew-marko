# Marko — Homebrew tap

A Homebrew tap for [Marko](https://github.com/yash-banka/marko-releases), a fast,
native Markdown viewer for macOS.

## Install

```sh
brew tap yash-banka/marko
brew trust yash-banka/marko
brew install --cask marko
```

The `brew trust` step is not optional. Homebrew 6 refuses to load a cask from a
third-party tap until you explicitly trust it, so without it the install stops
with *"Refusing to load cask … from untrusted tap"*. It is Homebrew asking you
to confirm you meant to run code from outside its own repositories — you only
do it once per tap.

Marko is signed with a Developer ID certificate and notarized by Apple, so it
opens without any Gatekeeper prompt after installing.

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
