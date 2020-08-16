let mapleader =","
"let g:plug_window = 'noautocmd vertical topleft new'

" Some basics:
    set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8
    set number relativenumber
    set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim-data/plugged"'))
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
call plug#end()

" Enable autocompletion:
"	set wildmode=longest,list,full

" Keybinds
map <C-n> :NERDTreeToggle<CR>
