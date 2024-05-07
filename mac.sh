# Ask for the administrator password upfront
sudo -v

# ------- Homebrew -------
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew... 🍺"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
echo "Updating homebrew... 🆕"
brew update
# ------- Homebrew -------

# ------- Apps -------
echo "Installing homebrew cask 🧙‍♂️"
brew install --cask raycast google-chrome brave-browser telegram discord visual-studio-code logi-options-plus orbstack alacritty firefox
brew install go eza fzf fd bat zoxide git-delta rm-improved tree ripgrep tmux zsh-autosuggestions zsh-syntax-highlighting starship neovim

brew cleanup
# ------- Apps -------

# ------- Git -------
echo "Git config... 🦸‍♂️"
# git config --global user.name "tung"
# git config --global user.email "nthtung08@gmail.com"
cp ./.gitconfig ~/.gitconfig
# ------- Git -------

# ------- SSH Key for GitHub -------
echo "Creating an SSH key for you... 🔐"

ssh-keygen -t ed25519 -C "nthtung08@gmail.com" -N '' -f '/Users/tung/.ssh/id_ed25519' 

eval "$(ssh-agent -s)"

echo "Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config  

ssh-add --apple-use-keychain ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub

# ------- Mac Settings -------
echo "Setting some Mac settings... ⚙️"
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES

# Show the ~/Library folder
chflags nohidden ~/Library 

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# dock setting
defaults write com.apple.dock tilesize -int 45
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 65
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true
killall Dock

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Trackpad: enable tap to click for this user and for the login screen
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`, `Nlsv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Hot corners
# Possible values:
#  1: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Bottom right screen corner → None
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0
# ------- Mac Settings -------

# ------- Node -------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.zshrc

nvm instsall --lts &&

npm i -g npm pm2 pnpm
# ------- Node -------

# ------- Font -------
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
# ------- Font -------

# ------- alacritty -------
mkdir -p ~/.config/alacritty
cp ./alacritty.toml ~/.config/alacritty/
# ------- alacritty -------

# ------- tmux -------
cp ./.tmux.conf ~/
# ------- tmux -------

# ------- .zshrc -------
cp ./.zshrc ~/ &&
# ------- .zshrc -------

# ------- neovim -------
mkdir -p ~/.config
cp -r nvim ~/.config
# ------- neovim -------

cd 
git clone git@github.com:junegunn/fzf-git.sh.git
source ~/.zshrc
