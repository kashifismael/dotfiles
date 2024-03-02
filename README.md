# dotfiles
Dot files repo for various terminal configuration

https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/

## Install ZSH
```bash
sudo apt install zsh
```

### Use custom .zshrc 
```bash
source ~/dotfiles/zsh/.zshrc
```

## Install dependencies
```bash
sudo apt install kubectl
sudo apt install neovim
sudo apt install fzf
sudo apt install ripgrep
sudo apt install fd-find #fd already taken on ubuntu
sudo apt install bat
sudo apt install diff-so-fancy
```

## Setup symlinks
```bash
ls -s ~/repos/dotfiles/nvim ~/.config/nvim
```
