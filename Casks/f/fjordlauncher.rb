cask "fjordlauncher" do
  version "8.4.2"
  sha256 "d4ef9fd7da1dd53a319f927ee25157721fb2a812d1ccdb7c3ffd7a8badfb59e8"

  url "https://github.com/unmojang/FjordLauncher/releases/download/#{version}/FjordLauncher-macOS-#{version}.zip"
  name "fjordlauncher"
  desc "Prism Launcher fork with support for alternative auth servers"
  homepage "https://github.com/unmojang/FjordLauncher"

  app "Fjord Launcher.app"

  zap trash: [
    "~/Library/Application Support/FjordLauncher",
    "~/Library/Preferences/org.prismlauncher.FjordLauncher.plist",
    "~/Library/Saved Application State/org.prismlauncher.FjordLauncher.savedState"
  ]
end
