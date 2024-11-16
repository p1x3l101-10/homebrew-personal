cask "ryujinx" do
  version "1.2.72"
  sha256 "57917d242d74a4529893114c861ac9dbc13fbeb8079d06e06f224bbc336e9b6f"

  url "https://github.com/GreemDev/Ryujinx/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "ryujinx"
  desc "Open-source Nintendo Switch emulator"
  homepage "https://ryujinx-emulator.com"

  depends_on macos: ">= :monterey"

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
    "~/Library/Logs/Ryujinx"
  ]
end
