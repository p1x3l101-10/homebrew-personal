#!/bin/bash

git clone https://github.com/Homebrew/brew /var/tmp/homebrew
eval $(/var/tmp/homebrew/bin/brew shellenv)
mkdir -p $(brew --prefix)/etc/homebrew
mkdir -p $(brew --prefix)/etc/kitty
mkdir -p $(brew --prefix)/etc/zshrc.d

cat <<EOF > $(brew --prefix)/etc/homebrew/brew.env
HOMEBREW_CASK_OPTS=--appdir=/var/tmp/homebrew/Applications
HOMEBREW_NO_INSTALL_FROM_API=1
HOMEBREW_FORCE_BREWED_CA_CERTIFICATES=1
HOMEBREW_FORCE_BREWED_CURL=1
HOMEBREW_FORCE_BREWED_GIT=1
HOMEBREW_FORCE_VENDOR_RUBY=1
HOMEBREW_BOOTSNAP=1
HOMEBREW_BUNDLE_FILE_GLOBAL=/var/tmp/homebrew/etc/homebrew/Brewfile
HOMEBREW_BUNDLE_DUMP_DESCRIBE=1
EOF

cat <<EOF > $(brew --prefix)/etc/homebrew/links.conf
~r/var/tmp/homebrew:~h/.brew
~p/etc/kitty:~h/.config/kitty
~p/etc/zshrc:~h/.zshrc
EOF

cat <<EOF > $(brew --prefix)/etc/homebrew/Brewfile
tap "homebrew/bundle"
tap "homebrew/casks"
tap "homebrew/core"
tap "homebrew/services"
tap "p1x3l101-10/personal"
brew "openjdk@17"
brew "openjdk@21"
brew "p1x3l101-10/personal/mindustry"
brew "p1x3l101-10/personal/zulu@8"
cask "kitty"
cask "pollymc"
cask "wine@staging"
EOF

cat <<EOF > $(brew --prefix)/etc/environment
XDG_CONFIG_DIR=\$HOME/.config
WHALEBREW_CONFIG_DIR=\$HOMEBREW_PREIFX/etc/whalebrew
EOF

cat <<EOF > $(brew --prefix)/etc/zshrc
for rc in $(brew --prefix)/etc/zshrc.d/*; do
	. \$rc
done
EOF
cat <<EOF > $(brew --prefix)/etc/zshrc.d/01-homebrew.sh
eval \$($(brew --prefix)/bin/brew shellenv)
EOF

cat <<EOF > $(brew --prefix)/etc/zshrc.d/01z-global-environment.sh
. \$(brew --prefix)/etc/environment
EOF

brew update
brew bundle --global install
brew link-files
brew link-apps
