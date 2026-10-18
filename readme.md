# Personal ZSH Configuration
## First installation
```sh
# Goto home:
cd

# Save current ~/.zshrc:
mv ~/.zshrc ~/.zshrc.old

# Clone this repo wherever you want (default : in your home directory):
git clone https://github.com/AlexlHer/pzc ~/.pzc

# Copy ~/.pzc/home.zshrc from repo cloned to ~/.zshrc:
cp ~/.pzc/templates/template.zshrc ~/.zshrc

# You can edit this file:
# If you have a PATH edit in your old .zshrc, you can add it:
vim ~/.zshrc

# First init:
zsh

# Edit json config:
pzc_config

```

## Update
```sh
cd ${PZC_PZC_DIR}
git stash
git pull
git stash pop
```

## Dependences

- jq (https://github.com/jqlang/jq)

## Optional progs
- oh-my-posh (https://github.com/JanDeDobbeleer/oh-my-posh)
- eza (https://github.com/eza-community/eza)
- mold (https://github.com/rui314/mold)
- atuin (https://github.com/atuinsh/atuin)
- fzf (https://github.com/junegunn/fzf)
- mise-en-place (https://github.com/jdx/mise)
- spack (https://github.com/spack/spack)
- yazi (https://github.com/sxyazi/yazi)
