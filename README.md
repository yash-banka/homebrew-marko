# Marko: Homebrew tap

A Homebrew tap for [Marko](https://github.com/yash-banka/marko-releases), a fast,
native Markdown viewer for macOS.

> **Marko has moved to the Mac App Store.** Marko 2.0 and every update after it
> ship only through the [Mac App Store](https://apps.apple.com/app/id6797180877),
> free. This cask installs 1.4.2, the last direct build, and is deprecated.
> Install from the App Store instead, or with [mas](https://github.com/mas-cli/mas):
>
> ```sh
> mas install 6797180877
> ```

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

1.4.2 is the last update this cask will get. Marko continues on the Mac App
Store, which updates it from then on.

## Uninstall

```sh
brew uninstall --cask marko
```

Add `--zap` to remove Marko's preferences and caches as well.
