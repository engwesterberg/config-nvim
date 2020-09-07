call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons' 
Plug 'dracula/vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'peitalin/vim-jsx-typescript'
Plug 'eslint/eslint'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'lervag/vimtex'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'KabbAmine/vCoolor.vim'
Plug 'ap/vim-css-color'
Plug 'w0rp/ale'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
call plug#end()
if (has("termguicolors"))
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
 set termguicolors
endif
let python_highlight_all=1
syntax enable
colorscheme palenight
set relativenumber
set number
set splitright
set noswapfile
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set ignorecase
set smartcase
set nohlsearch
set cursorline
set scrolloff=10
set modifiable
set title
set mouse=a

let mapleader = "\<Space>"
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 1

"Automaticaly lint files with these extensions
autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Emmet settings
let g:user_emmet_leader_key=','
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Make it easier to switch buffers
nnoremap <leader>b :buffers<CR>:buffer<space>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <leader>* :CocSearch <C-R>=expand("<cword>")<CR><CR>
"Add color with colorpicker
nnoremap <leader>c :VCoolor <CR>
"
"Remap for easier macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>
" Vertical resize
nnoremap <silent> <Leader>+ :vertical resize -5<cr>
nnoremap <silent> <Leader>- :vertical resize +5<cr>
nnoremap <Leader><S-b> :B<CR> 

"Remap escape in insert mode
:imap jj <Esc>


" use alt+hjkl to move between split/vsplit panels
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
" Improve the navigation in the buffers 
command! B call Buffers() 

function! Buffers() 
    execute "buffers" 
    let buffer=input("Enter a buffer:") 
    execute "b" . buffer 
endfunction

