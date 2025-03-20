cask "leomard" do
  version "0.6"
  sha256 ""

  url "https://github.com/Athlon007/Leomard/releases/download/#{version}/Leomard.dmg"
  name "layendanimat"
  desc "Anime Viewing app for Desktop"
  homepage "https://github.com/Layendan/Layendanimator"

  app "Leomard.app"

  zap trash: ""
end
