runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set termguicolors
set background=dark
colorscheme solarized8_flat

let g:sshSession = ($SSH_CLIENT != "")

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Add to .vimrc to enable project-specific vimrc
set exrc
set secure

" exrc allows loading local executing local rc files.
" secure disallows the use of :autocmd, shell and write commands in local .vimrc files.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " Use actual tab chars in Makefiles.
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Use 4 spaces for indentation of solidity files
  autocmd FileType solidity setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  autocmd BufRead,BufNewFile *.jsm set filetype=javascript
  autocmd BufRead,BufNewFile *.es set filetype=javascript

  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
  autocmd BufNewFile,BufRead Berksfile set filetype=ruby
  autocmd BufNewFile,BufRead Guardfile set filetype=ruby
  autocmd BufNewFile,BufRead Formatronfile set filetype=ruby
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" enable line numbers
set nu

" For everything else, use a tab width of 2 space chars.
set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.
set shiftwidth=2    " Indents will have a width of 2.
set softtabstop=2   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" nerdcommenter options
let g:NERDSpaceDelims = 1

" NERDtree options
let NERDTreeShowHidden=1

" NERDTreeTabs options
let g:nerdtree_tabs_open_on_console_startup=1

" set encoding so that NERDtree subfolders work properly with nice icons
set encoding=utf-8

" swap and back up files etc - keep them out of the working directory
if has('win32')
  let vimfiles="vimfiles"
  let home=$HOME
else
  let vimfiles=".vim"
  let home=$HOME
endif

" integrate clipboard on macOS if not a remote session
if has('mac')
  if !g:sshSession
    set clipboard=unnamed
  endif
endif

let &backupdir=home."/".vimfiles."/backup//"
let &directory=home."/".vimfiles."/swap//"
let &undodir=home."/".vimfiles."/undo//"

" enable the pastetoggle shortcut on F2
set pastetoggle=<F2>

exec "source ".home."/".vimfiles."/config/vim-jsbeautify.vim"
exec "source ".home."/".vimfiles."/config/vim-markdown.vim"
exec "source ".home."/".vimfiles."/config/vim-lsp.vim"
exec "source ".home."/".vimfiles."/config/asyncomplete.vim"
exec "source ".home."/".vimfiles."/config/keys.vim"
exec "source ".home."/".vimfiles."/config/haskell.vim"
