set autoindent
set smartindent
set tabstop=3
set shiftwidth=3
set clipboard^=unnamed,unnamedplus
set wildmenu
set termguicolors
set wildmode=longest:full,full
set nu rnu
"set mouse=a
"set scrolljump=-20
set nocompatible
filetype off
syntax enable

nnoremap Gc :!groff -ms % -Tpdf > %.pdf && setsid -f zathura %.pdf<CR>
nnoremap Lc :!pdflatex "%" && setsid -f zathura *.pdf<CR>
nnoremap Fd :filetype detect<CR>
nnoremap <C-p> "+p
vnoremap <C-y> "+y

" Plugins (Download Vundle)
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc("~/.config/nvim/bundle/install/all/plugins/")
Plugin 'VundleVim/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'itchyny/lightline.vim'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'catppuccin/nvim', {'name': 'catppuccin'}
call vundle#end()            " required
filetype plugin indent on    " required
let g:UltiSnipsExpandTrigger="<c-j>"
let g:lightline = {'colorscheme': 'catppuccin'}
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
colorscheme catppuccin
