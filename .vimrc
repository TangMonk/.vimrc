call plug#begin('~/.local/share/nvim/plugged')
Plug 'bkad/CamelCaseMotion'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'yuttie/comfortable-motion.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'skywind3000/quickmenu.vim'
"Plug 'roxma/nvim-completion-manager'
Plug 'eugen0329/vim-esearch'
Plug 'rakr/vim-one'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'kshenoy/vim-signature'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Config                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd
set mouse=a
set backspace=indent,eol,start
set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
"set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set nobackup
set noswapfile
set showmode
set clipboard=unnamed
set expandtab
set belloff=all
set number
set showmatch
set so=7
syntax on

"matchit
if !has('nvim')
  packadd! matchit
endif

if has("mouse_sgr")
    set ttymouse=sgr
else
  if !has('nvim')
    set ttymouse=xterm2
  endif
end

" Color Schmea
colorscheme one
set background=light
"set guifont=Source\ Code\ Pro\ for\ Powerline:h14


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Key Map                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
set pastetoggle=<F3>
nnoremap <F3> :noh<CR>
noremap <F4> :source ~/.vimrc<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
" map CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

nmap <c-s> :w<CR>
imap <C-s> <esc>:w<CR>
map <C-w> <esc>:q<CR>

let mapleader = ","

"" for esc delay
set timeoutlen=1000 ttimeoutlen=0

" toggle number
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

nnoremap <F5> :call NumberToggle()<cr>
nnoremap <F6> :!subl %:p<cr>
nnoremap <F7> :!code %:p<cr>

nnoremap H gT
nnoremap L gt

" map the window tab move
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Atl hjkl movement in insert mode
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Plugin Config                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeShowHidden=1

" Snip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<F4>"

" ctrlp ignore
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp)|(\.(swp|ico|git|svn))$'

"airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='one'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#buffers_label = 'b'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '❗️'
let g:ale_sign_column_always = 1

"NERDCommenter
map <C-_> <leader>c<space>

"quickmenu
noremap <F12> :call quickmenu#toggle(0)<cr>
" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"

call g:quickmenu#append('<F2> File tree', 'NERDTreeToggle', 'NERDTree toggle')
call g:quickmenu#append('<F3> Disable highlight search', 'noh', '')
call g:quickmenu#append('<F4> source vim config', 'source ~/.config/nvim/init.vim', '')
call g:quickmenu#append('<F5> relative number toggle', 'call NumberToggle()', '')
call g:quickmenu#append('<F6> Open in sublime', '!subl %:p', '')
call g:quickmenu#append('<F7> Open in vscode', '!code %:p', '')

"nvim-completion-manager
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }


let g:deoplete#enable_at_startup = 1


if has("gui_running")
  set linespace=2
  "set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  set macligatures
  set guifont=Fira\ Code:h14
endif
