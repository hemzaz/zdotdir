# zdotdir

ALL IN ONE, ZSH CONFIGURATION

## Installation
Install some Requirements and basic shell tools:  
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"   
brew install q jo yq curl tree tldr fzf mani ncurses xz p7zip pyenv nvm rpl readline git git-flow-avh starship  
curl -sS https://webi.sh/pathman | sh  
```  

It's a good idea to backup existing files first:

```zsh
./backup.zsh
```

Install this dotfiles repo to your `$ZDOTDIR`:
```zsh
./install.zsh
# load zsh
zsh
```

## Look-and-feel  
### Fonts

Install [nerd fonts][nerd-fonts] via homebrew:

```zsh 
./getfonts.sh 
``` 

## Resources
- [antidote][antidote]
- [zephyr][zephyr]
- [zshzoo][zshzoo]
- [zsh_unplugged][zsh_unplugged]
- [prezto][prezto]
- [oh-my-zsh][oh-my-zsh]
- [supercharge your terminal with zsh][supercharge-zsh]
- [awesome zsh][awesome-zsh-plugins]

[antidote]:             https://github.com/mattmc3/antidote
[awesome-zsh-plugins]:  https://github.com/unixorn/awesome-zsh-plugins
[dotfiles]:             https://dotfiles.github.io/
[homebrew]:             https://brew.sh
[iterm2-colors]:        https://github.com/mbadolato/iTerm2-Color-Schemes
[nerd-fonts]:           https://github.com/ryanoasis/nerd-fonts
[oh-my-zsh]:            https://github.com/ohmyzsh/ohmyzsh
[prezto]:               https://github.com/sorin-ionescu/prezto
[starship-toml]:        https://github.com/mattmc3/zdotdir/blob/main/prompt/starship.toml
[starship]:             https://starship.rs
[supercharge-zsh]:      https://blog.callstack.io/supercharge-your-terminal-with-zsh-8b369d689770
[zdotdir_gif]:          https://raw.githubusercontent.com/mattmc3/zdotdir/resources/img/zdotdir.gif
[zephyr]:               https://github.com/zshzoo/zephyr
[zsh_unplugged]:        https://github.com/mattmc3/zsh_unplugged
[zshzoo]:               https://github.com/zshzoo/zshzoo
