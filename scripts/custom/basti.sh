#!/usr/bin/env zsh
set +e

# install zsh 'basti-style', cred-alert, vim config
source "${WORK_DIR}"/scripts/custom/basti-zsh.sh
source "${WORK_DIR}"/scripts/opt-in/cred-alert.sh
source "${WORK_DIR}"/scripts/common/vim-configurations.sh

# get rid of bloat
brew uninstall --force docker
brew uninstall --cask --force rowanj-gitx
brew uninstall --cask --force sourcetree
brew uninstall --cask --force gitup
brew uninstall --cask --force github

echo "Installing direnv"
brew install direnv
echo "Installing zoxide"
brew install zoxide

brew install mas
brew tap cantino/mcfly
brew install mcfly        # better shell history
brew install lsd          # better ls
brew install bat          # better cat
brew install git-delta    # better diff
brew install dust         # better du
brew install duf          # better df
brew install broot        # better file ops in directory
brew install fd           # better find
brew install choose       # better cut
brew install glances htop # better top
brew install dog
brew install ripgrep
brew install fzf

# For developers of shell scripts
brew install jq # json parsing

# Text Editors & note taking
brew install --cask sublime-text
brew install --cask obsidian

brew install microsoft-office
brew install adobe-creative-cloud
brew install boxcryptor
brew install google-drive
brew install meetingbar
brew install balenaetcher
brew install onyx
brew install signal
brew install spotify
brew install zoom
brew install deepl
brew install expressvpn
brew install fanny
brew install keka
brew install calibre
brew install veracrypt
brew install vnc-viewer
brew install teamviewer
brew install arq
brew install bitwarden
brew install keepassxc
brew install pivotal/tap/git-together

# sdks
brew install google-cloud-sdk

echo
echo "Adding Powerline fonts tap to Homebrew"
brew tap homebrew/cask-fonts

echo
echo "Add font-hack-nerd-font"
brew install --cask font-hack-nerd-font

# mac app store installations
read -r -p "Please sign in to App Store manually and press 'y' to install apps from App Store..." APPLE_ID
if [[ 'y' == "$APPLE_ID" ]]; then
  mas purchase 1284863847 # Unsplash Wallpapers
  mas purchase 973134470  # Be focused
  mas purchase 1474276998 # HP Smart for Desktop
  mas purchase 1094255754 # outbank
  mas purchase 1147396723 # WhatsApp
  mas purchase 1352778147 # Bitwarden
fi

# mac os configurations
source "$WORK_DIR"/scripts/custom/basti-macos-config.sh

# git customization
echo
if [[ ! -f ~/.git-together ]]; then
  echo "Putting a sample git-together file in ~/.git-together"
  cp ${WORK_DIR}/files/.git-together ~/.git-together
fi
git config --global --add include.path ~/.git-together

# install python & java & lima
source "$WORK_DIR/scripts/opt-in/python.sh"

# sdkman for java
source "$WORK_DIR/scripts/opt-in/java.sh"
echo
if [[ ! -d "$HOME/.sdkman" ]]; then
  echo "Installing sdkman"
  curl -s "https://get.sdkman.io?rcupdate=false" | bash
  # shellcheck disable=SC2016
  echo '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >>~/.zshrc.local
fi

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# install latest version
sdk install java

source "$WORK_DIR/scripts/opt-in/containerization.sh"
source "$WORK_DIR/scripts/custom/basti-git.sh"
