"---------------------------------------------------------------------------------------------------setting----------------------------------------------------------------------------------------------
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set splitbelow
:set splitright
:set showcmd
:set encoding=utf-8
:set fileencoding=utf-8
:set backspace=indent,eol,start
:set smartindent
:set expandtab
:set hidden
:set hlsearch
:set incsearch
:set ignorecase
:set smartcase
:set fileformats=unix,dos,mac
:set wildmenu
:set mousemodel=popup
:set t_Co=256
:set guioptions=egmrti
:set gfn=Monospace\ 10
:set ruler
:set number
:set scrolloff=3
:set laststatus=2
:set modeline
:set modelines=10
:set title
:set titleold="Terminal"
:set titlestring=%F
:set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
:set clipboard=unnamedplus
:set shell=sh
":set transparency =7 darle transparencia 
":set gcr=a:blinkon0

"---------------------------------------------------------------------------------------------------setting----------------------------------------------------------------------------------------------

"---------------------------------------------------------------------------------------------------funciones para la inastalacion de plugin------------------------------------------------------------

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else 
    :let curl_exists=expand('curl')
endif

let g:vim_bootstrap_langs = ""
let g:vim_bootstrap_editor = "neovim"				" nvim or vim
let g:vim_bootstrap_theme = "molokai"
let g:vim_bootstrap_frams = ""
 
if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

"---------------------------------------------------------------------------------------------------funciones para la inastalacion de plugs--------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------PLUGS----------------------------------------------------------------------------------------------

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'tomasr/molokai'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors:
Plug 'easymotion/vim-easymotion' "easymotion = vim sneak
Plug 'preservim/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/PhilRunninger/nerdtree-buffer-ops'
Plug 'https://github.com/PhilRunninger/nerdtree-visual-selection'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'



if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
"Plug 'SirVer/ultisnips' ver si de alguna manera puede ser compatible con coc
"por lo del tab
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete'

" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" ----------------------------------------------------------------------------------------------------PLUGS---------------------------------------------------------------------------------------------

"---------------------------------------------------------------------------------------------------coc-------------------------------------------------------------------------------------------------

" Required:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr><cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"esto mismo de arriba hacer con tab checar si no choca con lo que quiero de
"agregar 4 espacios al tab al escribir

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf  <Plug>(coc-fix-current)
"gf sirve para ir al archivo que esta siendo llamado

" Use K to show documentation in preview window.
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
"refrescar el autocompletado para que aparezcan opciones
noremap <silent><expr> <c-space> coc#refresh()
"------------------------------------------------------------------------------------------------------coc----------------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------------------------shortcuts customized without lider---------------------------------------------------------------

"nerdtree
map <F2> :NERDTreeFind<CR>
map <F3> :NERDTreeToggle<CR>

" abrir terminal, open explorer, restart neovim 
" poner aqui los atajos que esplico la linea anterior
" resize split,  + = se agranda , - = se achica
noremap <silent> <right> :vertical resize +5<CR>
noremap <silent> <left> :vertical resize -5<CR>
noremap <silent> <up> :resize +5<CR>
noremap <silent> <down> :resize -5<CR>

"Ventanas nuevas derecha y abajo por defectos debido a los seteos que hice
nmap <c-t> :<C-u>vsplit tabnew<CR>
nmap <c-n> :<C-u>tabnew<CR>

"ir al final de la linea
nmap<silent>¿ :normal $<CR>
nmap <silent>d¿ :normal d$<CR>
nmap <silent>y¿ :normal y$<CR>
"buffers adelante y atras
noremap <a-h> :bp<CR>
nnoremap <a-l> :bn<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"------------------------------------------------------------------------------------------------------shortcuts customized without lider---------------------------------------------------------------

"----------------------------------------------------------------------------------shortcuts customized lider: espacio----------------------------------------------------------------------------------

let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
"nmap es que funciona solamente en modo normal
"Atajos personalizados
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>a :wq<CR>
nmap <Leader>W :wq!<CR>
nmap <Leader>Q :q!<CR>
nnoremap <leader>t :split <CR>:ter<CR>

"splits
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>n :<C-u>tabnew<CR>

" Close currently buffer
noremap <leader>c :bd<CR>


"----------------------------------------------------------------------------------shortcuts customized lider: espacio----------------------------------------------------------------------------------

"-----------------------------------------------------------------------------------------------------shortcuts customized.-----------------------------------------------------------------------------

"----------------------------------------------------------------------------------shortcuts customized lider:, ----------------------------------------------------------------------------------------

"Required:
filetype plugin indent on
" Map leader to ,
let mapleader=','
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"borrar busqueda para desmarcar la palabra resaltada
noremap <leader><space> :nohlsearch<CR>

" Git y fugitive

"Git init (necesario instalar el Flog para inresar comandos directos de git
"desde vim) (%:p:h = hace referecia a la carpeta donde estoy parado en el
"archivo actual)
noremap <Leader>gi :Git init %:p:h<CR>

" abre una ventana para ver el estado ed git que tenemos donde podemos interactuar con git
noremap <Leader>gs :Git<CR>

" muestra una comparativa de com va el codigo agregado con el que estaba a
" modo de historial con los datos del autor, del commit, fecha y sus metadatos
" de todo
noremap <Leader>gb :Git blame<CR>

" es un add. en git con la diferencia que primero guarda el archivo o hace el
" :write y luego el git add . se le puede agregar un directorio en seguida
noremap <Leader>ga :Gwrite<CR>

" muestra una ventana vertical con las diferencias mostradas por el git  de lo
" hecho vs lo que estaba
noremap <Leader>gd :Gvdiffsplit<CR>

"hacer commit del codigo
noremap <Leader>gc :Git commit --verbose<CR>

"push del codigo
noremap <Leader>gsh :Git push<CR>

"pull del codigo
noremap <Leader>gll :Git pull<CR>

"Git remove
noremap <Leader>gr :GRemove<CR>

"Git browse
noremap <Leader>go :GBrowse<CR>

" Git-Flog
noremap <Leader>gf :Flogsplit<CR>

"cerrar sesion de o buffer que lo tengo con cierra la sesion por completo de
"todos los buffers por completo
nnoremap <leader>sc :CloseSession<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"ver donde estoy parado 
nnoremap <leader>- :lcd<CR>

"listas de busqueda en pantalla buffers y archivo en la carpeta donde estoy
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>e :FZF -m<CR>

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

"----------------------------------------------------------------------------------shortcuts customized lider:, ----------------------------------------------------------------------------------------

"-----------------------------------------------------------------------------------------visualmode----------------------------------------------------------------------------------------------------

" Vmap for maintain Visual Mode after shifting > and < (identado para dar o quitar tabs)
vmap < <gv
vmap > >gv

" Move visual block, mayusculas osea shift + j,k para mover arriba o abajo la linea (identado)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"----------------------------------------------------------------------------------------visualmode----------------------------------------------------------------------------------------------------

"-----------------------------------------------------------------------------------------------------------Rules-------------------------------------------------------------------------------------

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
" Visual Settings
"*****************************************************************************
syntax on

let no_buffers_menu=1
colorscheme molokai

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1

"-----------------nerdtree rules-----------------
  " let g:NERDTreeDirArrowExpandabld="+"
  " let g:NERDTreeDirArrowCollapsible="~"
  let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0"
  let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
  let g:NERDTreeGitStatusBinPath ='/your/file/path' " default: git (auto find in path)
  " let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
  " let g:NERDTreeHidden=0 " para no mostrar los archivos ocultos
  let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)"
  let NERDTreeShowBookmarks=1   " Show NERDTree bookmarks

  let g:NERDTreeGitStatusIndicatorMapCustom = {
                   \ 'Modified'  :'✹',
                   \ 'Staged'    :'✚',
                   \ 'Untracked' :'✭',
                   \ 'Renamed'   :'➜',
                   \ 'Unmerged'  :'═',
                   \ 'Deleted'   :'✖',
                   \ 'Dirty'     :'✗',
                   \ 'Clean'     :'✔︎',
                   \ 'Ignored'   :'☒',
                   \ 'Unknown'   :'?',
                   \}

         " let g:NERDTreeDisableFileExtensionHighlight = 1
         " let g:NERDTreeDisableExactMatchHighlight = 1
         " let g:NERDTreeDisablePatternMatchHighlight = 1
         " let g:NERDTreeFileExtensionHighlightFullName = 1
         " let g:NERDTreeExactMatchHighlightFullName = 1
         " let g:NERDTreePatternMatchHighlightFullName=1
         " let g:NERDTreeHighlightFolders = 1
         " let g:NERDTreeHighlightFoldersFullName=1 
         " let g:NERDTreeExtensionHighlightColor = {}
"-----------------nerdtree rules-----------------

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
  
endif


if &term =~ '256color'
  set t_ut=
endif

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

let g:airline_powerline_fonts=1

"*****************************************************************************
" Abbreviations
"*****************************************************************************
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"*****************************************************************************
" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
" Autocmd Rules
"*****************************************************************************
" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstar
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_linters = {}

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
"-------------------nerdcommenter rules----------------------------------------
"reglas del nerdcommenter con lider asignado como ,(checar documentation para
"ver los shortcuts)
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"-------------------nerdcommenter rules----------------------------------------

"-----------------------------------------------------------------------------------------------------------Rules-------------------------------------------------------------------------------------

"---------------------------------------------------------------------------------------- Include user's local vim config-----------------------------------------------------------------------------

if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"---------------------------------------------------------------------------------------- Include user's local vim config-----------------------------------------------------------------------------

"----------------------------------------------------------------------------------------------------------Marcos visuales----------------------------------------------------------------------------

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" air-line
 let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
     endif

     " unicode symbols
     let g:airline_left_sep = '»'
     let g:airline_left_sep = '▶'
     let g:airline_right_sep = '«'
     let g:airline_right_sep = '◀'
     let g:airline_symbols.linenr = '␊'
     let g:airline_symbols.linenr = '␤'
     let g:airline_symbols.linenr = '¶'
     let g:airline_symbols.branch = '⎇'
     let g:airline_symbols.paste = 'ρ'
     let g:airline_symbols.paste = 'Þ'
     let g:airline_symbols.paste = '∥'
     let g:airline_symbols.whitespace = 'Ξ'

     " airline symbols
     let g:airline_left_sep = ''
     let g:airline_left_alt_sep = ''
     let g:airline_right_sep = ''
     let g:airline_right_alt_sep = ''
     let g:airline_symbols.branch = ''
     let g:airline_symbols.readonly = ''
     let g:airline_symbols.linenr = ''

"----------------------------------------------------------------------------------------------------------Marcos visuales----------------------------------------------------------------------------
