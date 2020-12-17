" .vimrc

" vim-plug有効化
call plug#begin('~/.vim/plugged')

" プラグイン導入
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

" Powerlineフォント有効化
let g:airline_powerline_fonts = 1

" UIテーマ設定
let g:airline_theme = 'deus'

" 行番号表示
set number

" 検索設定
set hlsearch
set ignorecase
set incsearch
set smartcase
set showmatch

" シンタックスハイライト有効化
syntax on

" 自動インデント
set autoindent

" ファイルタイプ毎にプラグインとインデントを自動設定
filetype plugin indent on

" コマンド支援
set showcmd
set wildmenu

" backspace設定
set backspace=2

" NerdTreeキーバインド
nnoremap <silent><C-e> :NERDTreeToggle<CR>
