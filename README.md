# vim

```
cd ~
git clone --recursive git@github.com:pghalliday-dotfiles/.vim.git
cp -f .vim/dotfiles/.* .
```

or for windows

```
git clone --recursive git@github.com:pghalliday-dotfiles/.vim.git %USERPROFILE%\vimfiles
echo source ~/vimfiles/config.vim > %USERPROFILE%\_vimrc
```

## YouCompleteMe

To complete the installation of the YouCompleteMe plugin it must be compiled. The short version is:

```
cd ~/.vim/bundle/YouCompleteMe
./install.py
```

For more options and dependencies see http://valloric.github.io/YouCompleteMe/

## vim-fugitive

To complete the installation of the vim fugitive plugin:

```
vim -u NONE -c "helptags vim-fugitive/doc" -c q
```

see https://github.com/tpope/vim-fugitive
