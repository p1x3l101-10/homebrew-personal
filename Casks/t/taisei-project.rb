cask "taisei-project" do
  version "1.4.1"
  sha256 "eaae180f2013a4a3f140290da803a566c78206887a584f29d497ac27aa1b5cb2"

  url "https://github.com/taisei-project/taisei/releases/download/v#{version}/Taisei-#{version}-universal.dmg"
  name "Taisei Project"
  desc "A free and open-source Touhou Project fangame"
  homepage "https://taisei-project.org/"

  app "Taisei.app"

  zap trash: [
    "~/Library/Application Support/taisei",
    "~/Library/Saved Application State/org.taisei-project.taisei.savedState"
  ]
end
