cask "ryujinx" do
  version "1.1.1385"
  sha256 "010d5af48e7b18c79f7d3e0a19a70fbf432bc6aff4a9517209a3c7c28aba8c76"

  url "https://github.com/Ryujinx/release-channel-master/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "ryujinx"
  desc "Open-source Nintendo Switch emulator"
  homepage "https://ryujinx.org"

  depends_on macos: ">= :monterey"

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
    "~/Library/Logs/Ryujinx"
  ]
end
