syntax on

set t_Co=256
set modifiable
set write
set noundofile " ファイル名.un~ファイルを作成しない
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set number
set relativenumber
set noshowmode
set cursorline
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示

set scrolloff=3    " ３行余裕をもってスクロール
set wildmode=longest,full " ファイル名のタブ補完
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set mouse=a " マウスの入力を受け付ける
set clipboard=unnamedplus " ヤンクでクリップボードにコピー
noremap! <S-Insert> <C-R>+
set history=10000 " コマンドラインの履歴を10000件保存する
set whichwrap=b,s,h,l,<,>,[,],~ " 行をまたいで移動

" jjでエスケープ
inoremap <silent> jj <ESC>

" move
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" noremap <C-j> j
" noremap <C-k> k
" noremap <C-h> h
" noremap <C-l> l


" 画面分割のコマンド
nnoremap ss :<C-u>sp<CR> " 水平分割
nnoremap sv :<C-u>vs<CR> " 垂直分割
nnoremap sq :<C-u>q<CR>  " ウインドウを閉じる
nnoremap sj <C-w>j       " 下に移動 
nnoremap sk <C-w>k       " 上に移動
nnoremap sl <C-w>l       " 右に移動
nnoremap sh <C-w>h       " 左に移動
nnoremap sJ <C-w>J       " 画面自体を下に移動
nnoremap sK <C-w>K       " 画面自体を上に移動
nnoremap sL <C-w>L       " 画面自体を右に移動
nnoremap sH <C-w>H       " 画面自体を左に移動
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>

" 画面分割してterminal mode
nnoremap stt :<C-u>tabnew<CR>:term<CR> " 水平分割
nnoremap sst :<C-u>sp<CR>:term<CR><C-w>J " 水平分割

" terminal modeでinsert-modeからnormal-modeに戻る
tnoremap <Esc> <C-\><C-n>

" edit snippets
nnoremap snip :CocCommand snippets.editSnippets<CR> " edit snippet

" xで消したものをヤンクしない
nnoremap x "_x
nnoremap X "_X

" colorscheme setting
nnoremap <F9> :colorscheme molokai<CR>
nnoremap <F10> :colorscheme sonokai<CR>

" If you want to start window resize mode by `Ctrl+T`
let g:winresizer_start_key = '<C-T>'

" lightline setting
let g:lightline = {
      \ 'colorscheme': 'powerline'  
      \ }
" powerline, sonokai

let g:lightline.tab = {
		    \ 'active': [ 'tabnum', 'filename', 'modified' ],
		    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

" easymotion setting
" デフォルトのキーマッピングを無効に
let g:EasyMotion_do_mapping = 0
" f + 2文字 で画面全体を検索してジャンプ
nmap f <plug>(easymotion-overwin-f2)
" 検索時、大文字小文字を区別しない
let g:EasyMotion_smartcase = 1
" 検索後の移動文字を変更
let g:EasyMotion_keys = 'fjdkslaureiwoqpvncm'

" ranger setting
map <C-r> :Ranger<CR>

" caw.vim setting  行の最初の文字の前にコメント文字をトグル
nmap <C-c> <Plug>(caw:hatpos:toggle)
vmap <C-c> <Plug>(caw:hatpos:toggle)

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" 起動するbrowserをgoogle-chromeに変更
let g:openbrowser_browser_commands = [
\   {
\       "name": "/usr/bin/google-chrome",
\       "args": ["{browser}", "{uri}"]
\   }
\ ]

" yank-history setting
nmap <space>p :YankHistoryRgPaste 

"<F5> でコード実行
function! Exe()
  echo "Exe"
  let filename = expand('%:t')
  if stridx(filename, ".py") != -1 
    !python3 %
  elseif stridx(filename, ".jl") != -1
    !julia %
  elseif stridx(filename, ".cpp") != -1 
    !./build_run.sh
  else
    echo "unknown filetype"+filename
  endif
endfunction
command! Exe :call Exe()
nmap <F5> :Exe

let g:python3_host_prog = '/usr/bin/python3'


call plug#begin('~/.vim/plugged')
" base
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'sainnhe/sonokai'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" snippet
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'valloric/youcompleteme'

" Install nvim-cmp
Plug 'hrsh7th/nvim-cmp'
" Install the buffer completion source
Plug 'hrsh7th/cmp-buffer'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'mechatroner/rainbow_csv'  " csvの色付け
Plug 'easymotion/vim-easymotion'
Plug 'simeji/winresizer'        " 画面分割
Plug 'tyru/caw.vim'             " comment-out
" Plug 'luochen1990/rainbow'      " 複数カッコの色分け
" Plug 't9md/vim-textmanip'       " テキストオブジェクトで移動

" Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
" Plug 'tmhedberg/matchit'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-surround'


" R-lang
" Plug 'roxma/nvim-completion-manager'
Plug 'ncm2/ncm2'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'w0rp/ale'

" python
" Plug 'zchee/deoplete-jedi'
" Plug 'davidhalter/jedi-vim'
" Plug 'neovim/python-client'
"
" ------LSPsetting-----
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" ------coc.nvim setting---------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

" ----- fzf ------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yazgoo/yank-history'

call plug#end()

" colorscheme
" colorscheme molokai
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
" let g:sonokai_transparent_background = 1
colorscheme sonokai

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
let g:fzf_preview_window = []

" fzf settings
let $FZF_DEFAULT_OPTS="--layout=reverse"
"let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let $FZF_DEFAULT_COMMAND="find . -type f"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset':0.5, 'border': 'sharp'}}

let mapleader = "\<Space>"

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

inoremap <expr> <c-x><c-f> fzf#vim#complete#path("find . -type f", fzf#wrap({'dir': expand('%:p:h')}))

" -----LSPsetting-----
"
" if executable('pyls')
"     au User lsp_setup call lsp#register_server({
"       \ 'name': 'pyls',
"       \ 'cmd': {server_info->['pyls']},
"       \ 'whitelist': ['python'],
"       \ })
" endif
" 
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"     disable = {
"       'lua',
"       'ruby',
"       'toml',
"       'c_sharp',
"       'vue',
"     }
"   }, 
"   indent = {
"     enable = true, -- tree-sitterによるインデントを有効に
"   }
" }
" EOF
" 
" lua <<EOF
"   local cmp = require('cmp')
"   cmp.setup {
"     -- You can set mappings if you want
"     mapping = {
"       ['<C-k>'] = cmp.mapping.select_prev_item(),
"       ['<C-j>'] = cmp.mapping.select_next_item(),
"       ['<C-u>'] = cmp.mapping.scroll_docs(-4),
"       ['<C-i>'] = cmp.mapping.scroll_docs(4),
"       ['<C-Space>'] = cmp.mapping.complete(),
"       ['<C-c>'] = cmp.mapping.close(),
"       ['<CR>'] = cmp.mapping.confirm({
"         behavior = cmp.ConfirmBehavior.Insert,
"         select = true,
"       })
"     },
" 
"     -- You should specify your *installed* sources.
"     sources = {
"       { name = 'buffer' },
"     },
"   }
" EOF
" 
" command! -bang Colors
"  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
" 


" --------coc-vim setting---------------
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" -------- coc-explorer --------
nnoremap <space>e :CocCommand explorer<CR>

" -------- nvim-r ----------
let g:R_assign = 0
let g:R_insert_mode_cmds = 1
let g:r_indent_align_args = 0
let g:R_rconsole_width = 0

let g:maplocalleader = ","

" [,rf]でRが起動し、[,ro]でオブジェクトブラウザが起動
" Rの終了は[,rq]で、現在の行を実行するのが[,l]
" [,rs]でカーソル上のsummary、[,rp]でprint、[,rh]でhelp

" vim-fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gc :Git commit<CR><CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gb :Git blame<CR>


