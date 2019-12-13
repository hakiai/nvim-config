call plug#begin('~/.vim/plugged')
"  Plug 'shougo/vimfiler' "vimfiler
  Plug 'shougo/unite.vim' "検索を早く
  Plug 'scrooloose/nerdtree' "ファイラ
  Plug 'ryanoasis/vim-devicons' "ファイルアイコン
  Plug 'tpope/vim-surround' "カッコの挿入を便利に
  Plug 'airblade/vim-gitgutter' "Gitの変更を表示
  Plug 'tpope/vim-repeat' "ドットによるリピートを強力にする
  Plug 'tpope/vim-commentary' "gccで一気にコメントアウト
  Plug 'vim-airline/vim-airline' "ステータスバーをいい感じに
  Plug 'alvan/vim-closetag' "htmlタグを閉じてくれる
  Plug 'w0rp/ale' "シンタックスチェック
  Plug 'Yggdroot/indentLine' "インデント見やすく
  Plug 'easymotion/vim-easymotion' "移動プラグイン
  Plug 'LeafCage/yankround.vim' "Ctrl + pで過去のクリップボード参照
  Plug 'cohama/lexima.vim' "カッコ補完
  Plug 'Shougo/deoplete.nvim' "補完
  Plug 'Shougo/deoplete-lsp'
  Plug 'prabirshrestha/vim-lsp'

call plug#end()

"===== 表示設定 =====
set number "番号の表示
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
set list "タブ、空白、改行を可視化
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
syntax on "コードに色をつける
autocmd ColorScheme * highlight ALEError ctermfg=22 guifg=#008800

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
inoremap <C-h> <Delete>

"jキーを二度押しでESCキー
inoremap <silent> jj <Esc>
inoremap <silent> っj <ESC>

"===== プラグイン関連 =====
"vimfiler
" nmap sf :VimFiler -split -simple -winwidth=30 -no-quit<Return>
" nmap sb :Unite buffer<Return>
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_enable_auto_cd = 0
" let g:vimfiler_tree_leaf_icon = ''
" let g:vimfiler_tree_opened_icon = '▾'
" let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_marked_file_icon = '✓'

"NERDTree
nmap sf :NERDTreeToggle<Return>

"closetag
let g:closetag_filenames = '*.html,*.vue,*.erb,*.php'

"easymotion
let g:EasyMotion_do_mapping = 0

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
"
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
vmap <Leader>s <Plug>(easymotion-bd-f2)
"
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)

" yankround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50

"===== その他 =====
"履歴を10000件保存
set history=10000
set nobackup "バックアップファイルを作らない
set noswapfile "スワップファイルを作らない
set autoread "編集中のファイルが変更されたら自動で読み直す
set hidden "バッファが編集中でもそのほかのファイルを開けるようにする
set hidden "バッファが編集中でもそのほかのファイルを開けるようにする

"補完機能
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

"モード切り替えを早く
set ttimeoutlen=0

"クリップボード共有
set clipboard=unnamed

