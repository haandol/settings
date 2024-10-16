set nocompatible
" Search recursively downward from CWD; provides TAB completion for filenames
" e.g., `:find vim* <TAB>`
set path+=**

" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start

" don't create `filename~` backups
set nobackup

" don't create temp files
set noswapfile

" line numbers and distances
" set relativenumber 
set number 

" number of lines offset when jumping
set scrolloff=2

" Tab key enters 2 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 

" Indent new line the same as the preceding line
set autoindent

" statusline indicates insert or normal mode
set showmode showcmd

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase

" As opposed to `wrap`
"set nowrap

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" open new buffers without saving current modifications (buffer remains open)
set hidden

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" for linux
"set clipboard=unnamedplus
" for macOS
set clipboard=unnamed

" Folding
" https://vim.fandom.com/wiki/Folding
" https://vim.fandom.com/wiki/All_folds_open_when_opening_a_file
" https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1

" netrw and vim-vinegar
let g:netrw_browse_split = 3

" Plugins, syntax, and colors
" ---------------------------------------------------------------------------
" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Make sure to use single quotes
" Install with `:PlugInstall`

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/stevearc/oil
Plug 'stevearc/oil.nvim'

" https://github.com/nvim-tree/nvim-tree.lua/wiki/Installation
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://github.com/fenetikm/falcon/wiki/Installation
Plug 'fenetikm/falcon'

" https://github.com/uloco/bluloco.nvim
Plug 'rktjmp/lush.nvim'
Plug 'uloco/bluloco.nvim'

" Initialize plugin system
call plug#end()

syntax enable
" Neovim only
set termguicolors 

" Light scheme
colorscheme bluloco-light

" Show character column
set colorcolumn=80

" Keymaps
" set new leader key
let g:mapleader = " "

" fzf
nnoremap <C-p> <cmd>Files<CR>
" window movement
nnoremap <C-h> <C-w>h <CR>
nnoremap <C-j> <C-w>j <CR>
nnoremap <C-k> <C-w>k <CR>
nnoremap <C-l> <C-w>l <CR>
nnoremap <C-h> <cmd>wincmd h<CR>
nnoremap <C-j> <cmd>wincmd j<CR>
nnoremap <C-k> <cmd>wincmd k<CR>
nnoremap <C-l> <cmd>wincmd l<CR>
" window management
nnoremap <leader>sv <C-w>v <CR>
nnoremap <leader>sh <C-w>s <CR>
nnoremap <leader>sx <cmd>close<CR>
" tab
nnoremap <leader>to <cmd>tabnew<CR>
nnoremap <leader>tx <cmd>tabclose<CR>
nnoremap <Tab> <cmd>tabn<CR>
nnoremap <S-Tab> <cmd>tabp<CR>
" oil
nnoremap <leader>- <cmd>Oil><CR>
" nvimtree
nnoremap <leader>ee <cmd>NvimTreeToggle<CR>
nnoremap <leader>ef <cmd>NvimTreeFindFileToggle<CR>
nnoremap <leader>ec <cmd>NvimTreeCollapse<CR>
nnoremap <leader>er <cmd>NvimTreeRefresh<CR>

" lightline config - add file 'absolutepath'
" Delete colorscheme line below if using Dark scheme
let g:lightline = {
      \ 'colorscheme': 'PaperColor_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified' ] ]
      \ }
      \ }

" nvim tree, disable netrw
let g:loaded_netrwPlugin = 1
let g:loaded_netrw = 1

" Marker based foding in vim files
autocmd FileType vim setlocal foldmethod=marker

" plugin config (lua)
lua require("nvim-tree").setup()
lua require("oil").setup()
