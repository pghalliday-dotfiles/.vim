# vim

Clone recursively to vim files directory

```
git clone --recursive git@github.com:pghalliday-dotfiles/vim.git ~/.vim
```

or (windows)

```
git clone --recursive git@github.com:pghalliday-dotfiles/vim.git %USERPROFILE%\vimfiles
```

and create the vimrc config

```
echo "source ~/.vim/config.vim" > ~/.vimrc
```

or (windows)

```
echo source ~/vimfiles/config.vim > %USERPROFILE%\_vimrc
```
