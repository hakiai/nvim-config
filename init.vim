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
autocmd InsertEnter,InsertLeave * set cursorline! "インサートモードの時のみ、行をハイライトする
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
nnoremap <CR> A<CR><ESC>
nnoremap J 10j
nnoremap K 10k
nnoremap H ^
nnoremap L $
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
map sH <C-w>H
map sK <C-w>K
map sJ <C-w>J
map sL <C-w>L
nmap st :tabnew<Return>
nmap th :tabprev<Return>
nmap tl :tabnext<Return>

"インサートモード
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Delete>

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
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

"モード切り替えを早く
set ttimeoutlen=50

"クリップボード共有
set clipboard=unnamed

