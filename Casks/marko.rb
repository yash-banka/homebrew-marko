cask "marko" do
  version "1.2.0"
  sha256 "105d87c2295e18e936096b9fb87cc81217110a395444b167bc9b41d208b74002"

  url "https://github.com/yash-banka/marko-releases/releases/download/v#{version}/Marko.dmg"
  name "Marko"
  desc "Markdown viewer that renders GFM, Mermaid, and KaTeX offline"
  homepage "https://github.com/yash-banka/marko-releases"

  livecheck do
    url "https://raw.githubusercontent.com/yash-banka/marko-releases/main/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Marko.app"

  zap trash: [
    "~/Library/Caches/com.yashbanka.marko",
    "~/Library/HTTPStorages/com.yashbanka.marko",
    "~/Library/Preferences/com.yashbanka.marko.plist",
    "~/Library/WebKit/com.yashbanka.marko",
  ]
end
