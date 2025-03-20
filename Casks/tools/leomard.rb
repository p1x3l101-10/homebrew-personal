cask "leomard" do
  version "0.6"
  sha256 "546b355852f27cdfe6100641bb5571f61674657927c57d8477770755ebbb0791"

  url "https://github.com/Athlon007/Leomard/releases/download/#{version}/Leomard.dmg"
  name "layendanimat"
  desc "Anime Viewing app for Desktop"
  homepage "https://github.com/Layendan/Layendanimator"

  app "Leomard.app"

  zap trash: ""
end
