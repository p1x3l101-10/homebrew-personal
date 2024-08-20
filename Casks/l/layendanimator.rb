cask "layendanimator" do
  version "0.1.58"
  sha256 "381835442923ebddaf9485f303bf1b611eae91b049cc6b5d5f43959b96e8bafa"

  url "https://github.com/Layendan/Layendanimator/releases/download/#{version}v/Layendanimator_#{version}_x64.dmg"
  name "layendanimat"
  desc "Anime Viewing app for Desktop"
  homepage "https://github.com/Layendan/Layendanimator"

  app "Layendanimator.app"

  zap trash: ""
end
