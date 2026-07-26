cask "marko" do
  version "1.2.0"
  sha256 "105d87c2295e18e936096b9fb87cc81217110a395444b167bc9b41d208b74002"

  url "https://github.com/yash-banka/marko-releases/releases/download/v#{version}/Marko.dmg"
  name "Marko"
  desc "Markdown viewer that renders GFM, Mermaid, and KaTeX offline"
  homepage "https://github.com/yash-banka/marko-releases"

  # Read the same Sparkle feed the app itself updates from, so the cask can
  # never claim a version the appcast doesn't serve. `&:short_version` is
  # load-bearing: the default strategy returns Sparkle's `nice_version`, which
  # fuses shortVersionString with the build number ("1.2.0,12") and matches
  # neither this cask's version nor the tag in the download URL — `brew audit`
  # fails on the mismatch.
  livecheck do
    url "https://raw.githubusercontent.com/yash-banka/marko-releases/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Marko updates itself through Sparkle. Without this, `brew upgrade` would
  # reinstall over a version Sparkle had already moved forward. The cask owns
  # installing; Sparkle owns updating.
  auto_updates true
  # Bare symbol, not ">= :sonoma": Homebrew parses `depends_on macos:` with a
  # ">=" comparator already, so this means "Sonoma or newer" and matches
  # LSMinimumSystemVersion 14.0. The string form is deprecated in Homebrew 6.
  depends_on macos: :sonoma

  app "Marko.app"

  # Only the com.yashbanka.marko domain. A dev machine also accumulates
  # ~/Library/Preferences/Marko.plist, ~/Library/Caches/Marko and a set of
  # com.yashbanka.marko.diag paths, but those come from unsigned local builds
  # and the diagnostic bundle, not from anything a released Marko writes —
  # and a bare "Marko" path could belong to some other app entirely.
  zap trash: [
    "~/Library/Caches/com.yashbanka.marko",
    "~/Library/HTTPStorages/com.yashbanka.marko",
    "~/Library/Preferences/com.yashbanka.marko.plist",
    "~/Library/WebKit/com.yashbanka.marko",
  ]
end
