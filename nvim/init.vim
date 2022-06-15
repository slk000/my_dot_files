"----------------------------------------------------------------------
" Vim-Plug
"----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Status Line
Plug 'vim-airline/vim-airline'

" 括号匹配
Plug 'Raimondi/delimitMate'

" theme
Plug 'sainnhe/edge'

" 目录管理
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Easy motion
Plug 'easymotion/vim-easymotion'

" 异步运行命令
Plug 'skywind3000/asyncrun.vim'

Plug 'vim-scripts/SingleCompile'

" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" smooth scroll ctrl + f / ctrl + d
Plug 'psliwka/vim-smoothie'

" Accelerate j and k
" Plug 'rhysd/accelerated-jk'

" comment
Plug 'preservim/nerdcommenter'

" markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪，输入 gd 就可以自动跳转
" Plug 'dgryski/vim-godef'

call plug#end()
"----------------------------------------------------------------------
" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

"To enable file type detection"
filetype on

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
" set mouse+=a


" Tab -> spaces
set ts=4
set expandtab
set autoindent

"----------------------------------------------------------------------
" 缩进相关
"----------------------------------------------------------------------
set shiftwidth=4 " 按> < 缩进时的宽度
set autoindent smartindent shiftround " 缩进
" 避免丢失visual模式下选择的本文. gv 重新选取上次所选择的范围
vnoremap < <gv
vnoremap > >gv
"----------------------------------------------------------------------

"----------------------------------------------------------------------                                             " Remap keys for gotos
"----------------------------------------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"----------------------------------------------------------------------

set cursorcolumn
set cursorline

set encoding=utf-8

let mapleader = "\<space>"

" 开启 24 位真彩色支持
" 24位真彩色信息请参考 https://gist.github.com/XVilka/8346728
set termguicolors

" 设置为系统剪贴板
set clipboard+=unnamed

" tmux中不能显示vim颜色，在.tmux.conf中添加下面两行
if !has('nvim')
    " set -g default-terminal "tmux-256color"
    " set -ga terminal-overrides ",*256col*:Tc"
    set term=xterm-256color
endif

" shift + h / shift + l 回到行首行尾
nmap H ^
nmap L $

" U = redo
nnoremap U <C-r>

" sudo 保存
cmap w!! w !sudo tee >/dev/null %


augroup lang_settings
    autocmd FileType cpp source ~/.myConfig/nvim/lang-settings/cpp-settings.vim
    autocmd FileType java source ~/.myConfig/nvim/lang-settings/java-settings.vim
augroup END 

" 设置主题
colorscheme edge
hi normal guibg=none ctermbg=none


"----------------------------------------------------------------------
" Airline 状态栏 & 标签设置
"----------------------------------------------------------------------
"set statusline=                                 " 清空状态了
"set statusline+=\ %F                            " 文件名
"set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
"set statusline+=%=                              " 向右对齐
"set statusline+=\ %y                            " 文件类型

" 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
" set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" shift + j 切换到前一个 tab
nmap J <Plug>AirlineSelectPrevTab
" shift + k 切换到后一个 tab
nmap K <Plug>AirlineSelectNextTab
" <leader> + <w> 退出当前的 tab
nmap <leader>w :bp<cr>:bd #<cr>
" <leader> + <t> 打开新的 tab
nmap <leader>t :enew<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = ''
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 




"----------------------------------------------------------------------
" elimitMate
"----------------------------------------------------------------------
"let delimitMate_expand_cr = 1 
"let delimitMate_expand_space = 1
"----------------------------------------------------------------------




"----------------------------------------------------------------------
" 设置 nerdtree
"----------------------------------------------------------------------
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '📂'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=1 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <leader>d :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
"----------------------------------------------------------------------



"----------------------------------------------------------------------
" AsyncRun
"----------------------------------------------------------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
"----------------------------------------------------------------------


"----------------------------------------------------------------------
" Coc-Nvim
"----------------------------------------------------------------------
" 使用 Tab 在列表中移动，Enter确认
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" {<cr>} 括号换行 + 插入空行 + 缩进
" https://github.com/neoclide/coc-pairs/issues/13
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"----------------------------------------------------------------------


" Single Compile
" let g:SingleCompile_usequickfix=1
" let g:SingleCompile_showquickfixiferror = 1
" let g:SingleCompile_quickfixwindowposition = 'belowright'

" let g:SingleCompile_silentcompileifshowquickfix = 1

"----------------------------------------------------------------------
" Accelerate j and k
"----------------------------------------------------------------------
" nmap j <Plug>(accelerated_jk_gj)
" nmap k <Plug>(accelerated_jk_gk)
"----------------------------------------------------------------------



"----------------------------------------------------------------------
" nerd commenter
"----------------------------------------------------------------------
" <leader> + / 切换注释
nmap <LEADER>/ <Plug>NERDCommenterToggle
vmap <LEADER>/ <Plug>NERDCommenterToggle<CR>gv
" 注释开头添加空格
let NERDSpaceDelims = 1
"----------------------------------------------------------------------



"----------------------------------------------------------------------
" markdown
"----------------------------------------------------------------------
let g:instant_markdown_mathjax = 1
"----------------------------------------------------------------------
