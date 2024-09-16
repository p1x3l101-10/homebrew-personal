class BrewTools < Formula
  desc "Homebrew extensions"
  homepage "https://github.com/p1x3l101-10/brew-tools"
  version "1.0"
  url "https://github.com/p1x3l101-10/brew-tools.git",
    tag: "v#{version}",
    revision: "7c7ca09cb5e449bdac0d85b15a71867f1ce38747"


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
