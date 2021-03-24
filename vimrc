"----------------------------------------------------------
" OPTIONS
"----------------------------------------------------------

" Mandatory
set nocompatible

" General
set noautochdir
set nobackup
set noconfirm
set   hlsearch
set   ignorecase
set   incsearch
set   isfname=@,48-57,/,.,-,_,+,,,#,$,%,~
set   shell=/usr/bin/zsh
set   tags=./tags;,tags;,tags-vendor;
set   ttyfast

" Display
set   background=dark
set   display=lastline
set   foldcolumn=2
set   laststatus=2
set   lazyredraw
set   linespace=2
set   number
set   ruler
set   scrolloff=5
set   showcmd
set   showmatch
set   showmode
set   statusline=[%n]\ %f%1*%m%*\ [%{&ff}]%h%r\ %y
set   statusline+=\ %#warningmsg#
set   statusline+=%*
set   statusline+=%=[%B:%b]\ %c,%l/%L\ %P

" Tabs & indent
set   autoindent
set   smartindent
set   expandtab
set   shiftwidth=4
set   shiftround
set   tabstop=4

" Behaviour
set   backspace=2
set   completeopt=longest,menu
set   directory=~/.vim/tmp//,/tmp//,/var/tmp//
set   formatoptions=tcqn
set   gdefault
set   mouse=a
set   nrformats-=octal
set   selection=inclusive
set   smartcase
set nostartofline
set   updatetime=250
set   whichwrap=<,>,[,]
set   wildmenu
set   wildmode=list:longest

" Windows
set   splitbelow
set   splitright

" GUI specific
if has("gui_running")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
	set guicursor+=a:blinkon0
	set guioptions-=m
    set guioptions-=T
    set columns=168
    set lines=52
endif

"----------------------------------------------------------
" GLOBAL AND BUFFER VARIABLES, PERSONAL AND PLUGINS
"----------------------------------------------------------

" , better than \
let mapleader = ","

" yankring
let g:yankring_history_dir = '~/.vim/tmp'
let g:yankring_map_dot = 0
let g:yankring_max_element_length = 10000

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDSpaceDelims = 1

" CTRLP
let g:ctrlp_regexp_search = 0
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co -x node_modules']
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
let g:ctrlp_use_caching = 0

" airline
let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'
"let g:airline_solarized_bg = 'dark'

" UltiSnips
let g:UltiSnipsExpandTrigger = "<F1>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsListSnippets = "<cs-tab>"

" SideSearch
let g:side_search_prg = "ag --word-regexp --ignore='*.js.map' --ignore='node_modules' --heading --stats -B 1 -A 4"

" Supertab
" let g:SuperTabDefaultCompletionType = "context"

" GitGutter
let g:gitgutter_sign_column_always = 1

"----------------------------------------------------------
" GENERAL MAPPINGS
"----------------------------------------------------------

" The basics
map Q :q<cr>

" PHP stuff
inoremap <C-l> ->

" matching tab
nmap <tab> %
vmap <tab> %

" highlight but don't jump
" nnoremap * *<C-o>

" better home/end behaviour
nnoremap <home> ^
vnoremap <home> ^
nnoremap <S-home> 0
vnoremap <S-home> 0
vnoremap <end> g_

" substitute & search helpers
vnoremap <leader>s :s/\(.*\)/
nnoremap S :%s/
vnoremap g/ "oyk/<C-r>o<CR>

" Custom text objects
" inside slashes
onoremap i/ :<c-u>normal! T/vt/<cr>
" inside underscores
onoremap i_ :<c-u>normal! T_vt_<cr>
" last pasted text
onoremap p :<c-u>normal! '[v']<cr>

" Clipboard
noremap <s-insert> "+gp
noremap <c-insert> "+y
inoremap <s-insert> <c-r>+

" Shift + arrows to scroll by screen line
nmap <s-up> gk
nmap <s-down> gj
imap <s-up> <c-o>gk
imap <s-down> <c-o>gj

" Ctrl + arrows to scroll buffer without moving cursor
nmap <c-up> <c-y>
nmap <c-down> <c-e>
imap <c-up> <c-x><c-y>
imap <c-down> <c-x><c-e>

" Avoid scrolling by page
vmap <s-up> <up>
vmap <s-down> <down>
vmap <c-up> <up>
vmap <c-down> <down>

" Window switching
nmap <cs-up> <c-w><up>
nmap <cs-down> <c-w><down>
nmap <cs-left> <c-w><left>
nmap <cs-right> <c-w><right>
imap <cs-up> <c-o><c-w><up>
imap <cs-down> <c-o><c-w><down>
imap <cs-left> <c-o><c-w><left>
imap <cs-right> <c-o><c-w><right>

" Insert tab or do keyword completion 
" inoremap <Tab> <C-R>=CleverTab()<CR>

" Omnicompletion on ALT+p
inoremap <M-p> <C-X><C-O>

" Filename completion on ALT+f
inoremap <M-f> <C-X><C-F>

" Jump to tag in new split
nnoremap <leader>g :split<cr><c-]>

"----------------------------------------------------------
" FUNCTION KEYS
"----------------------------------------------------------
nnoremap <silent> <F1> :ClearCtrlPCache<cr>\|:CtrlPBuffer<cr>
nnoremap <silent> <F2> :ClearCtrlPCache<cr>\|:CtrlP<cr>
nnoremap <silent> <F3> :call ExtendedCtrlP()<cr>
nnoremap <silent> <F4> :nohlsearch<cr>
nmap     <silent> <F5> "myiw:CtrlP<CR><C-\>rm
nmap     <silent> <S-F5> "myiw:call ExtendedCtrlP()<CR><C-\>rm
nnoremap <silent> <F6> :GitGutterToggle<CR>
nnoremap <silent> <F7> :Gstatus<CR>
nnoremap <silent> <F8> :sy on<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> <F10> :NERDTreeFind<cr>
nnoremap <silent> <F11> :YRShow<CR>
nnoremap <silent> <F12> :source ~/.vimrc<CR>

"----------------------------------------------------------
" PLUGIN MAPPINGS
"----------------------------------------------------------
" NERDtree
nnoremap <leader>r :NERDTreeFind<CR>

" Tabular
vnoremap <Leader>t> :Tab/=><cr>
vnoremap <Leader>t= :Tab/=<cr>
vnoremap <Leader>t\| :Tab/\|<cr>
vnoremap <Leader>t: :Tab/:<cr>

" PHP namespaces
nnoremap <leader>e :call PhpExpandClass()<cr>
nnoremap <leader>i :call PhpInsertUse()<cr>

" SideSearch current word and return to original window
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
nnoremap <Leader>s/ :SideSearch "<C-r>/"<CR> | wincmd p
nmap <Leader>sv ^vg_g*:SideSearch "<C-r>*"

" Create an shorter `SS` command
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'

" or command abbreviation
cabbrev SS SideSearch

" Vim Asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" NERDCommenter
map <M-c> ,c<space>

"----------------------------------------------------------
" COMMANDS
"----------------------------------------------------------
command! JSON :set ft=json | :%!python -m json.tool

"----------------------------------------------------------
" FUNCTIONS
"----------------------------------------------------------

" CtrlP including vendor
function! ExtendedCtrlP()
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co -x node_modules']
    ClearCtrlPCache
    CtrlP
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
endfunction

"----------------------------------------------------------
" AUTOCOMMANDS
"----------------------------------------------------------
"au BufNewFile,BufRead * let b:match_debug = 1
au BufNewFile,BufRead *.stub set ft=php
au BufNewFile,BufRead *.twig set ft=html

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'docunext/closetag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'andymass/vim-matchup'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/surround.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/YankRing.vim'
Plug 'honza/vim-snippets'
Plug 'ddrscott/vim-side-search'
Plug 'haya14busa/vim-asterisk'
Plug 'ervandew/supertab'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-jdaddy'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/seoul256.vim'
call plug#end()

colorscheme seoul256
