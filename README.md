# vim

```
cd ~
git clone --recursive git@github.com:pghalliday-dotfiles/.vim.git
cp -f .vim/dotfiles/.* .
```

or for windows:

Create a user level environment variable `HOME` to point to the home directory you wish to use then run

```
git clone --recursive git@github.com:pghalliday-dotfiles/.vim.git %HOME%\vimfiles
echo source ~/vimfiles/config.vim > %HOME%\_vimrc
```

## Asyncomplete

TODO: Does LSP need to be setup to support this?

https://github.com/prabirshrestha/asyncomplete.vim

## vim-fugitive

To complete the installation of the vim fugitive plugin:

```
vim -u NONE -c "helptags vim-fugitive/doc" -c q
```

see https://github.com/tpope/vim-fugitive
