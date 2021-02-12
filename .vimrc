" leader
let mapleader = " "

set ruler " display cursor position
set showcmd " display incomplete commands
set laststatus=2 " always display the status line
set autowrite " automatically write before running commands
set scrolloff=1 " display at least 1 lines around you cursor
set visualbell " prevent Vim from beeping
set noerrorbells " prevent Vim from beeping
set backspace=indent,eol,start " backspace behaves as expected
set hidden " hide buffers when switching between them
set encoding=utf-8 "set the encoding
set nowrap " no word wrap
  autocmd FileType markdown setlocal wrap " except on markdown

" switch syntax highlighting on, when the terminal has colors
" also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'dag/vim-fish'
" Plug 'rust-lang/rust.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
call plug#end()

augroup vimrcEx
  autocmd!

  " when editing a file, always jump to the last known cursor position.
  " don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " Limit linters used
  let g:ale_linters_explicit = 1 " only run linters specifically configured
  let g:ale_linters = {
  \  'javascript': ['eslint'],
  \}
  " ale linting events
  set updatetime=1000
  let g:ale_lint_on_text_changed = 0
  autocmd CursorHold * call ale#Queue(0)
  autocmd CursorHoldI * call ale#Queue(0)
  autocmd InsertEnter * call ale#Queue(0)
  autocmd InsertLeave * call ale#Queue(0)

  " Limit fixers used
  let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'css': ['prettier'],
  \}
  " ale fixing events
  let g:ale_fix_on_save = 1
augroup END

" Turn Off Swap Files
" ===================
set noswapfile                  " Disable .swp files
set nobackup                    " Disable ~ backup files
set nowritebackup               " No really
set backupdir^=$HOME/.vim/tmp// " But if you do, write it here
set directory^=$HOME/.vim/tmp// " Or here

" when the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" search
set incsearch " highlight search results when typing
set hlsearch " highlight search results
set ignorecase " ignore case when searching
set smartcase " upper case enables case sensitive search

" softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" use one space, not two, after punctuation
set nojoinspaces

" make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" numbers
set number
set numberwidth=5

" use hybrid line numbers in normal mode and absolute in insert mode
:set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" autocomplete with dictionary words when spell check is on
set complete+=kspell

" always use vertical diffs
set diffopt+=vertical

" auto indent new lines
set autoindent
filetype plugin indent on
" set smartindent

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" highlight current cursor line and column
set cursorline
highlight cursorline cterm=NONE ctermbg=8 ctermfg=NONE
set cursorcolumn
highlight cursorcolumn cterm=NONE ctermbg=8 ctermfg=NONE

" set the colorcolumn to dark
highlight ColorColumn ctermbg=1

" execute command while preserving editor state
function! Preserve(command)
  " save cursor position and search history
  let l:save = winsaveview()
  " do the business
  execute a:command
  " restore search history and cursor position
  call winrestview(l:save)
endfunction

" remove white space
nnoremap <Leader>ws :call Preserve("%s/\\s\\+$//e")<CR>

" ctrlp
" disable caching
let g:ctrlp_use_caching = 0
nnoremap <Leader>p :CtrlP<CR>
" skip gitignored files and folders
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" use ripgrep if possible
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
  else
      return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" tab-completion for file-related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

" ignore these globs when searching
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*
set wildignore+=*/.git/*,*/tmp/*,*.swp

" switch between the last two files
nnoremap <Leader><Leader> <c-^>

" get off my lawn
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
" Disable arrow keys completely in Insert Mode
imap <Up> <nop>
imap <Down> <nop>
imap <Left> <nop>
imap <Right> <nop>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" execute current line as shell command and replace with output
noremap Q !!$SHELL<CR>

" escape with kj
imap kj <Esc>
vmap kj <Esc>

" leader+v to generate new vertical split
nnoremap <silent> <Leader>v <C-w>v

" leader+h to generate new horizontal split
nnoremap <silent> <Leader>h <C-w>s

" leader+l to log the current word on the line below
nnoremap <silent> <Leader>l yiwoconsole.log('<Esc>pA', <Esc>pA);<Esc>

" leader+t+i to add empty it test
nnoremap <silent> <Leader>ti oit('', () => {<Return><Return>});<Esc>2kO<Esc>jf'ci'

" leader+t+d to add empty describe test
nnoremap <silent> <Leader>td odescribe('', () => {<Return>});<Esc>kO<Esc>jf'ci'

" leader+t+c to add empty try catch block
nnoremap <silent> <Leader>tc otry {<Esc>o}<Esc>ocatch (error) {<Esc>o}<Esc>

" leader+o+e to enable lab only
noremap <silent> <Leader>toe ^ea.only<Esc>^
" leader+o+d to disable lab only
noremap <silent> <Leader>tod :s/\.only//<Return>
" leader+tof to find focused tests
noremap <silent> <Leader>tof /\.only<Return>

" make Y behave like other capitals
map Y y$

