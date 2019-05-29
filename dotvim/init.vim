autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

set nocompatible

let mapleader = ";"

call plug#begin()
" Tmux zoom pane a like
nnoremap <C-w>z :ZoomWinTabToggle<CR>
"let g:zoomwintab_hidetabline = 1
Plug 'weezel/zoomwintab.vim'

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
Plug 'itchyny/lightline.vim'

" Language server settings
set hidden

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
inoremap <C-Space> <C-X><C-O>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['~/bin/pyls'],
    \ }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'ksh install.sh',
    \ }

let g:deoplete#enable_at_startup = 0
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/vim-hug-neovim-rpc'
" Language server settings ends

Plug 'vim-scripts/L9'

let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_extensions = ['tabline', 'ale']
let g:airline_detect_spell = 0
let g:airline_detect_paste = 0
let g:airline_detect_spelllang = 0
let g:airline_detect_iminsert = 0
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
let g:airline_theme='dark'
let g:airline_highlighting_cache=1
" Disable all plugins
"Plug 'vim-airline/vim-airline'

let g:ale_enabled=1
let g:ale_sign_error = '#'
let g:ale_sign_warning = '?'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 500
let g:ale_set_quickfix = 1
Plug 'w0rp/ale'

nnoremap <F2> :TagbarToggle<cr>
let g:tagbar_autofocus=0
let g:tagbar_sort = 1
Plug 'majutsushi/tagbar'

map <F3> :NERDTreeToggle<CR>
Plug 'scrooloose/nerdtree'

nnoremap <F4> :UndotreeToggle<cr>
Plug 'mbbill/undotree'

nnoremap <C-j> :CtrlPBuffer<CR>
let g:ctrlp_map = '<C-f>'
let g:ctrlp_cmd = 'CtrlPLine'
let g:ctrlp_extensions = ['line']
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_types = ['fil', 'buf', 'mru']
let g:ctrlp_open_new_file = 'ri'
let g:ctrlp_open_multiple_files = 'ri'
set wildignore+=*/tmp/*,*.so,*.swp
set wildignore+=*.gz,*.zip,*.7z,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
Plug 'ctrlpvim/ctrlp.vim'

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
	"let g:ackprg = 'ag --nogroup --nocolor --column'
endif
let g:ack_apply_qmappings = 0
nnoremap <leader>f :LAck!<Space>
Plug 'mileszs/ack.vim'

let g:UltiSnipsSnippetsDir = "~/configs/dotvim/snippets"
Plug 'SirVer/ultisnips'

"g:toggle_list_no_mappings
"nnoremap <script> <silent> <leader>c call: ToggleQuickfixList()<CR>
"nnoremap <script> <silent> <leader>x call: ToggleLocationList()<CR>
Plug 'milkypostman/vim-togglelist'

Plug 'jwhitley/vim-matchit'

Plug 'airblade/vim-gitgutter'

nmap <silent> <C-A-h> :BufSurfBack<CR>
nmap <silent> <C-A-l> :BufSurfForward<CR>
Plug 'ton/vim-bufsurf'

call plug#end()

if has("gui_running")
	"let moria_fontface = 'mixed'
	"let moria_monochrome = 1
	set guioptions-=T " No toolbar
	set guioptions-=m " No menubar
	set gfn=Hack\ Regular\ 10
	set guicursor=a:blinkon0
endif

set ttyfast
set lazyredraw

" Sanity check for colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	set t_Co=256
endif

colors peaksea
set background=dark

set listchars=tab:>-,eol:$,trail:.,extends:#
set backspace=indent,eol,start
set tm=500 " time out to 500msec
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o

" Put quickfix window always on bottom
botright cwindow
nnoremap Q gqap
vnoremap Q gq

" Visual
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l\[%v\],%c\ %)%L
syntax on

" Automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

set history=2000
set nowrap
set nobackup
set noswapfile
set ruler
set laststatus=2
set hlsearch
set number
set wildmenu
set showtabline=2

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" When splitting, don't substitute the current
" buffer with the newly opened one
set splitbelow
set splitright
" All splits are equal
autocmd VimResized * wincmd =
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE guifg=grey

" Undo related
set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.config/vim/undodir
if !isdirectory(&undodir) | call mkdir(&undodir, 'p', 0700) | endif

" Sane indent
set autoindent
set smarttab
set smartindent
set copyindent

" Padding when scrolling
" Vertical
set scrolloff=5
" Horizontal
set sidescrolloff=80

filetype on
filetype plugin indent on

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" #######################
" Encoding section
" #######################
" Default file encoding for new files
setglobal fenc=utf-8
"
" Auto detect file encoding when opening a file. To check what file encoding was
" selected run ":set fenc" and if you know the auto detection failed and want to
" force another one run ":edit ++enc=<your_enc>".
set fencs=utf-8,latin-1

" Internal encoding used by vim buffers, help and commands
set encoding=utf-8

" Terminal encoding used for input and terminal display
" Make sure your terminal is configured with the same encoding.
set tenc=utf-8

augroup my-human
    autocmd!
    autocmd FileType mail,human set formatoptions+=t textwidth=72
augroup end

" Reveal extra white spaces
"highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/
" Show trailing whitepace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Alternatively, the following pattern will match trailing whitespace, except
" when typing at the end of a line.
"match ExtraWhitespace /\s\+\%#\@<!$/

"#################################
"########### Mappings ############
"#################################
" Reload vimrc
nnoremap <leader><leader>v :source $MYVIMRC<CR>

" LEADER MAPPINGS
" Append to each matching line
nnoremap <leader>a :g/pattern/s/$/
" Execute macro on each matching line
nnoremap <leader>m :g/pattern/normal @q
" Go back to file where we jumped off
nnoremap <leader>b :e#<CR>
" Close current buffer
nnoremap <leader>, :bd<CR>

" Mappings for VimDiff
if &diff
	nnoremap <leader>1 diffput
	nnoremap <leader>2 diffget
endif

" Ctrl-C behaves like pressing Esc
inoremap <C-c> <Esc>

" Ctrl-Return adds a newline in command mode
nnoremap <C-CR> i<CR><Esc>

" Allow vi moving in insert mode when Alt is pressed
inoremap <A-h> <Left>
inoremap <A-k> <Up>
inoremap <A-j> <Down>
inoremap <A-l> <Right>
" Scrolling
nnoremap <C-A-j> <PageDown>
nnoremap <C-A-k> <PageUp>
inoremap <C-A-j> <ESC><C-E>i
inoremap <C-A-k> <ESC><C-Y>i
" Page up/down moving between buffers
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

" Sorry Vim guys, I'm used to readline
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
inoremap <C-d> <Delete>
inoremap <A-f> <C-Right>
inoremap <A-b> <C-Left>
"inoremap <A-d> <Esc><Right>dwi " Breaks small Ä

" More convenient moving between windows
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" QuickFix mappings
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" Allow deleting selection without updating the clipboard (yank buffer)
"noremap dd "_dd
"vnoremap x "_x
"vnoremap X "_X
" Don't move the cursor after pasting
" (by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[

" Don't so help, really
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a
" When scrolling, cursor stays in the middle
nnoremap <F1> :let &scrolloff=999-&scrolloff<CR>

" Visual text search
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" Remove folds while in diff mode
if &diff
	set foldminlines=99999
endif

" Paste Mode On/Off
map <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>
let paste_mode = 0 " 0 = normal, 1 = paste
func! Paste_on_off()
	if g:paste_mode == 0
		set paste
		set nonumber
		let g:paste_mode = 1
	else
		set number
		set nopaste
		let g:paste_mode = 0
		endif
	return
endfunc
