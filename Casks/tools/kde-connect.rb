cask "kde-connect" do
  version "4181"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm: "fa8233ff9504c7626615bfb576589fa64bbc178c65d3b8cd19392ff7a013e6a6",
         intel: "304e2be589a25ba55c753517047a2f564a58491f52fa28a80027a0561e88a177"
  url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/kdeconnect-kde-master-#{version}-macos-clang-#{arch}.dmg"
  name "KDE Connect"
  desc "Enabling communication between all your devices."
  homepage "https://kdeconnect.kde.org/"

  app "kdeconnect-indicator.app"

  zap trash: ""
end
