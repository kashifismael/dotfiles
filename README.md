# dotfiles
Dot files repo for various terminal configuration

## Install ZSH
```bash
sudo apt install zsh
```

### Use custom .zshrc 
```bash
source ~/repos/dotfiles/zsh/.zshrc
```

## Install dependencies
```bash
sudo apt install kubectl
sudo apt install neovim
sudo apt install fzf
sudo apt install ripgrep
sudo apt install fd-find #fd already taken on ubuntu
```

## Setup symlinks
```bash
ln -s ~/repos/dotfiles/nvim ~/.config/nvim
```
