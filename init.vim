"===== Dein読み込み =====
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  call dein#load_toml(s:toml_dir. '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"===== 表示設定 =====
set number "番号の表示
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
set list "タブ、空白、改行を可視化
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
syntax on "コードに色をつける
" 全角スペースを可視化
autocmd Colorscheme * highlight FullWidthSpace ctermbg=blue
autocmd VimEnter * match FullWidthSpace /　/
colorscheme pablo
highlight Pmenu ctermbg=17
highlight Pmenu ctermfg=14
highlight Search ctermfg=17
highlight PmenuSel ctermbg=45
highlight PmenuSel ctermfg=17


"===== 文字、カーソル設定 =====
set fenc=utf-8 "文字コードを指定
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set expandtab "Tabで空白を挿入
set autoindent "自動インデント
set smartindent "オートインデント
set tabstop=2 "インデントをスペース2つ分に設定
set shiftwidth=2 "自動的に入力されたインデントの空白を2つ分に設定
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ "不可視文字の指定
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする
set nocursorline "カーソル行を強調表示しない
autocmd InsertEnter * set cursorline "インサートモードの時のみ、行をハイライトする
autocmd InsertLeave * set cursorline!
"モードによってカーソルの形を変える
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"


"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする


"===== マウス設定 =====
set mouse=a

"===== キー入力 =====
"共通
let mapleader = "\<Space>"
noremap j gj
noremap k gk


"ノーマルモード
noremap <CR> A<CR><ESC>
noremap <C-j> 10j
noremap <C-k> 10k
noremap <C-h> ^
noremap <C-l> $
nnoremap <silent>ss :split<Return><C-w>w
nnoremap <silent>sv :vsplit<Return><C-w>w
noremap sh <C-w>h
noremap sk <C-w>k
noremap sj <C-w>j
noremap sl <C-w>l
noremap sH <C-w>H
noremap sK <C-w>K
noremap sJ <C-w>J
noremap sL <C-w>L
nnoremap <silent>st :tabnew<Return>
nnoremap <silent>th :tabprev<Return>
nnoremap <silent>tl :tabnext<Return>
nnoremap <silent>sp :bprev<CR>
nnoremap <silent>sn :bnext<CR>
nnoremap ; :
nnoremap : ;
nnoremap n nzz
nnoremap N Nzz
nnoremap x "_x

"インサートモード
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Delete>

" ヴィジュアルモード
vnoremap ; :
vnoremap : ;


"jキーを二度押しでESCキー
inoremap <silent> jj <Esc>
inoremap <silent> っj <ESC>


"===== その他 =====
"履歴を10000件保存
set history=10000
set nobackup "バックアップファイルを作らない
set noswapfile "スワップファイルを作らない
set autoread "編集中のファイルが変更されたら自動で読み直す
set hidden "バッファが編集中でもそのほかのファイルを開けるようにする

"補完機能
" set completeopt=menuone
" for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"   exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
" endfor

"モード切り替えを早く
set ttimeoutlen=0

"クリップボード共有
set clipboard=unnamed

" ノーマルモードに入るとIME off
let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
augroup MyIMEGroup
  autocmd!
  autocmd InsertLeave * :call system(g:imeoff)
augroup END

" 保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//e

"python path
let g:python_host_prog = expand('~/.pyenv/versions/neovim-2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim-3/bin/python')

