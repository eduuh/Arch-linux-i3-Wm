if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

" Javascript , jsx and react
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'
" Conguer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ColorScheme
Plug 'mhartington/oceanic-next'
" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

call plug#end()
