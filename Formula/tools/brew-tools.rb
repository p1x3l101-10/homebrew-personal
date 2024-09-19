class BrewTools < Formula
  desc "Homebrew extensions"
  homepage "https://github.com/p1x3l101-10/brew-tools"
  version "1.1"
  url "https://github.com/p1x3l101-10/brew-tools.git",
    tag: "v#{version}",
    revision: "a0c1086ca03817e742b42afc32416bafb19225ec"


  def install
    bin.install "brew-backup"
    bin.install "brew-full-up"
    bin.install "brew-link-apps"
    bin.install "brew-link-files"
    bin.install "brew-sign"
    bin.install "brew-sign-all"
    bin.install "brew-socks"
    bin.install "brew-x64"
  end
end
