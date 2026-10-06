cask "marko" do
  version "1.4.2"
  sha256 "fc9c96c3f286c6fbc8eb0a06cf786afda1f71fa08890cb9ea31fa69c5df9a6d2"

  url "https://github.com/yash-banka/marko-releases/releases/download/v#{version}/Marko.dmg"
  name "Marko"
  desc "Markdown viewer that renders GFM, Mermaid, and KaTeX offline"
  homepage "https://yashbanka.com/marko"

  # 1.4.2 is the last direct build. Marko 2.0 and everything after it ships only
  # through the Mac App Store, so the cask stays installable but tells people
  # where Marko went. Set the date to the day 1.4.2 is released.
  deprecate! date: "2026-10-06", because: "is now distributed through the Mac App Store"

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

  caveats <<~EOS
    Marko 2.0 is on the Mac App Store, free, and this copy won't be updated again:
      https://apps.apple.com/app/id6797180877
    With mas installed: mas install 6797180877
    Once the App Store copy is installed: brew uninstall --cask marko
  EOS

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
