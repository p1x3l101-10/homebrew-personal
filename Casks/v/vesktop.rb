# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "vesktop" do
  version "1.5.3"
  sha256 "71e39434748e684a826f390ceb846d52ed1886bab8b5385c5d94c377e3ac1172"

  url "https://github.com/Vencord/Vesktop/releases/download/v#{version}/Vesktop-#{version}-universal.dmg"
  name "vesktop"
  desc "Vesktop is a custom Discord App aiming to give you better performance and improve linux support "
  homepage "https://github.com/Vencord/Vesktop"
  
  app "Vesktop.app"

  zap trash: "~/Library/Application Support/vesktop"
end
