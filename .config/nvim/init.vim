" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ /\ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
" Author: @edwinmuraya

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

scriptencoding utf-8

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

" Javascript , jsx and react
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
"javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'ianks/vim-tsx'
Plug 'kien/ctrlp.vim'
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'
" File Exproler
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" React code snippets
Plug 'epilande/vim-react-snippets'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'w0rp/ale'
" Conguer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions=['coc-json', 'coc-tsserver', 'coc-emmet' ]

" status bar current file information
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
" adding the git branch on the status bar
Plug 'tpope/vim-fugitive'

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
" ColorScheme
Plug 'dikiaap/minimalist'
  " Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" colorised brackets
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

Plug 'jiangmiao/auto-pairs'
call plug#end()
let g:mapleader =","

" Editor theme

set background=dark
colorscheme minimalist
set mouse=a
set nohlsearch
" Yank and paste with thes system clipboard
set clipboard+=unnamedplus
set confirm
set showmatch
" Hides the buffes instead of closing them
set hidden

" changing the number of spaces tab counts for.
set softtabstop=2
" Indentatation amount for < and > commands

set shiftwidth=2

" Don't highight current cursor line
set nocursorline

" Disable line/colum number in status line
" show up in preview window whe airline is disable if not
set noruler

" Dont give completion messages like 'match 1 of 2
" or The only match
set shortmess+=c
" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif

set backupdir=~/.local/share/nvim/backup " don't put backups in current dir
set backup
set noswapfile

" Automatically re-read files if a change was detected outside iw vim
set autoread

" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on

set encoding=utf-8
set number relativenumber
" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright


" enabling syntax highlight
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" disable the arrow keys
 noremap <Up> <Nop>
 noremap <Down> <Nop>
 noremap <Left> <Nop>
 noremap <Right> <Nop>

 " colemak remapping to neiksj
noremap n j
noremap i l
noremap e k
noremap k n|noremap K N
noremap l i
" set j (same as h , cursor left) to 'end of word'
noremap j e|noremap J E
" The best!
noremap ; :|noremap : ;
noremap <silent> H 0
noremap <silent> I $

 " Faster in-line navigation
noremap W 5w
noremap B 5b

" _r_ = inner Text object
onoremap r i
" Same redo.
noremap U <C-r>
" Auto-bracket
inoremap {<CR> {<CR>}<Esc>0
" Replace ex mode with gq
map Q gq

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
"map <leader>b :vsp<space>$BIB<CR>
"map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %
" folding
noremap <silent> <LEADER>o za
" Rotate screen
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Ensure files are read as what I want:

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
" Disable the default s key
noremap s <non>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap se :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sn :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" Tab managements
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>
"Press <space> + q to close the window below the current window.
nnoremap < <<
nnoremap > >>

let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise



" Nerd tree
map <leader>w :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" automatically close nvim in nerdTree is only Thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ale_fixers = {
  \ 'javascript' : ['eslint']
  \ }

" let g:ale_sign_error= '❌'
" let g:ale_sign_warning = '⚠ '
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


" Conquer of Completion settings
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nmap <leader>do <Plug>(coc-codeaction)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selecten code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
