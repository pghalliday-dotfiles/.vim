# vim

```
cd ~
git clone --recursive git@github.com:pghalliday-dotfiles/.vim.git
cp -f .vim/dotfiles/.* .
```

or for windows

Create a user level environment variable `HOME` to point to the home directory you wish to use then run

```
git clone --recursive git@github.com:pghalliday-dotfiles/.vim.git %HOME%\vimfiles
echo source ~/vimfiles/config.vim > %HOME%\_vimrc
```

## deoplete.nvim

**NB. deoplete does not seem to be compatible with the Anaconda version of python3 (or at least the way it is installed)**

To resolve deoplete dependencies ensure that you have Vim installed with python3 support

```
brew upgrade python
brew remove vim
brew cleanup
brew install vim --with-python3
```

Also install  the python3 neovim module

```
pip3 install neovim
```

## vim-fugitive

To complete the installation of the vim fugitive plugin:

```
vim -u NONE -c "helptags vim-fugitive/doc" -c q
```

see https://github.com/tpope/vim-fugitive
