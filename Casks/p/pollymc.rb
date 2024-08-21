cask "pollymc" do
  version "8.0"
  sha256 "675d3fa2a079031f1f3bb890826e7a71b62839150d2cf64b80dea3f29b88b2d3"

  url "https://github.com/fn2006/PollyMC/releases/download/#{version}/PollyMC-macOS-#{version}.tar.gz"
  name "pollymc"
  desc "DRM-free Prism Launcher fork with support for custom auth servers. "
  homepage "https://github.com/fn2006/PollyMC"

  app "PollyMC.app"

  zap trash: [
    "~/Library/Application Support/PollyMC/metacache",
    "~/Library/Application Support/PollyMC/PrismLauncher-*.log",
    "~/Library/Application Support/PollyMC/prismlauncher.cfg",
    "~/Library/Preferences/org.prismlauncher.PrismLauncher.plist",
    "~/Library/Saved Application State/org.prismlauncher.PrismLauncher.savedState",
    ]
end
