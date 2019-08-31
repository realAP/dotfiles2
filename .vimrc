"install vim plug when not found
if empty(glob('~/.vim/autoload/plug.vim')) 
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"""""""""""""""PLUGINS"""""""""""""""
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'w0rp/ale'
Plug 'jalvesaq/nvim-r'
" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'andreypopp/vim-colors-plain'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'junegunn/rainbow_parentheses.vim'
"Plug 'luochen1990/rainbow'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

"Tagbar is a plugin for browsing the tags of source code files. It provides a
"sidebar that displays the ctags-generated tags of the current file, ordered by
"their scope. This means that for example methods in C++ are displayed under
"the class they are defined in.
"Plug 'majutsushi/tagbar'
"Plug 'scrooloose/syntastic'
"Plug 'blahgeek/neovim-colorcoder'

call plug#end()
"""""""""""""""""""""""""""""""""""""


"""""""""""""""MAPPINGS"""""""""""""""
"define leader
let mapleader=","

"toggle search highlighting
map <leader>n :noh<cr>h

"toggle spell check
map <leader>s :setlocal spell!<cr>

"yank current file in standard buffer and system clipboard(strg+p)
map <leader>y :%y+<cr>:%y<cr>

"close current window
map <leader>q :q<cr>
map <leader>d :bdelete %<cr>

"bind save to F2 from every mode
map <f2> :w<cr>
imap <f2> <esc>:w<cr>l
vmap <f2> <esc>:w<cr>

"easy window direction
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
"inoremap <A-h> <C-\><C-N><C-w>h
"inoremap <A-j> <C-\><C-N><C-w>j
"inoremap <A-k> <C-\><C-N><C-w>k
"inoremap <A-l> <C-\><C-N><C-w>l
"nnoremap <A-h> <C-w>h
"nnoremap <A-j> <C-w>j
"nnoremap <A-k> <C-w>k
"nnoremap <A-l> <C-w>l


""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""NEOVIM_COLORCODER"""""""""""""""""""""""""
" Enable colorcoder for those filetypes automatically.
"let g:colorcoder_enable_filetypes=['c', 'cpp', 'python']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""coc-mappings"""""""""""""""
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')



" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)
""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""AIRLINE/COLOR"""""""""""""""
"set powerline
let g:airline_powerline_fonts = 1

"set vim airline scheme
"let g:airline_theme='one'

let g:airline_theme='bubblegum'

"set colorscheme
colorscheme one 
"colorscheme plain

"set background colo.
set background=dark
"""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""FZF.VIM"""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" fzf.vim Ignore files specified by .gitignore #121
" https://github.com/junegunn/fzf.vim/issues/121
let $FZF_DEFAULT_COMMAND = 'ag --path-to-ignore ~/schneeroboter/.gitignore -g ""'

" Custom Mappings
map <f2> :w<cr>
map <leader>f :Files<cr>
map <leader>b :Buffers<cr>
"""""""""""""""""""""""""""""""""""""

"""""""""""""""NERDTREE"""""""""""""""
let g:NERDTreeWinPos = "left"
""""""""""""""""""""""""""""""""""""""


"""""""""""""""ALE"""""""""""""""
let g:ale_completion_enabled = 0
"set omnifunc=ale#completion#OmniFunc
"""""""""""""""""""""""""""""""""

"""""""""""""""INDENTLINE"""""""""""""
let g:indentLine_enabled = 1

""""""""""""""""""""""""""""""""""""""

"""""""""""""""MARKDOWN-PREVIEW""""""""""""""" 
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" commands
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

""""""""""""""""""""""""""""""""""""""


"""""""""""""""CUSTOM PLUGINS"""""""""""""""
"generate new ctags file from current dir and sub dirs by pressing f5
nnoremap <F5> :!ctags -R --exclude=build .<CR><CR>

"looks for a tags file in the current directory first and up and up until it finds it
set tags=tags;/
""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""Common Stuff"""""""""""""""
"hide menubar in gvim
set guioptions=agit

"set guifont=DroidSansMono\ 11

"no backward comatbility to vi
set nocompatible

"switches on syntax highlighting
syntax enable

" :h filetype-overview
"https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent#10125
"Checks Filetype for syntax checking and some other stuff
filetype plugin indent on

"Copy indent from current line when starting a new line (typing <CR>
"in Insert mode or when using the 'o' or 'O' command)
set autoindent

"buffer becomes hidden when it is abandoned
set hidden

"set encoding to utf-8
set encoding=utf-8

"highligth search pattern
set hlsearch

"saves the last 1000 commands
set history=1000

"shows line numbers relative
set relativenumber
"set number

"scroll space to dont reach the bottom thorugh scrolling
set scrolloff=7

"enables a menu at the bottom of vim window
set wildmenu

"(on the first tab)a list of completions will be shown and the command will be completed to the longest common command 
"(on second tab) the wildmenu will show up with all the completions that were listed before 
set wildmode=full

"When non-zero, a column with the specified width is shown at the side
"of the window which indicates open and closed folds
set foldcolumn=1

"set undo history
set undofile

"location for temp file for undo
set undodir=$HOME/vimundo/ 

"set undo history to 1000 changes
set undolevels=1000


"insert space characters whenever the tab key is pressed
set expandtab

"Use the appropriate number of spaces to insert a <Tab>
set tabstop=2

"Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.  It 'feels' like
"<Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is used
"set softtabstop=4 

"auto indent after '{' for functions
set shiftwidth=4

"When on, splitting a window will put the new window below the current one
set splitbelow

"When on, splitting a window will put the new window right of the current one
set splitright
""""""""""""""""""""""""""""""""""""""""""
