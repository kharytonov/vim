execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically detect file types. Place this line above the pathogen bundle
" loading if snipmate does not work.
filetype plugin indent on

" When vimrc is edited, reload it.
augroup myvimrchooks
    autocmd!
    autocmd bufwritepost .vimrc :source ~/.vimrc
augroup END

augroup omnicomplete_hooks
    autocmd!
    autocmd FileType python     :set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript :set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html       :set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        :set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        :set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php        :set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c          :set omnifunc=ccomplete#Complete
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy & Paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode with F2
set pastetoggle=<F2>

" Always exit paste mode when leaving insert mode
au InsertLeave * set nopaste

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting
syntax on

"Ignore case when searching
set ignorecase

" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Highlight search string
set hlsearch

" Show search matches as you type
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Will automatically reflect the buffer which you are working on.
set title
" Enable mouse. Use <Shift> and mouse to make selection to copy to clipboard.
set mouse=a
" Enable the mouse while running within GNU Screen
set ttymouse=xterm2
" Display numbers
set number
" Show line and column position
set ruler
" Set background to dark
" set background=dark

" Set collor scheme
colorscheme ir_black
" Tab configuration
map <leader>    :tabnew<cr>
map <leader>te  :tabedit
map <leader>tc  :tabclose<cr>
map <leader>tm  :tabmove
map <S-Tab>     :tabprevious<cr>
map <Tab>       :tabnext<cr>

" Changes the width of the TAB character.
set tabstop=4

" Use the appropriate number of spaces to insert tabs.
" Will insert 'softtabstop' amount of space characters. Otherwise, the
" amount of spaces inserted is minimized by using TAB characters.
set expandtab

" Copy the indentation from the previous line, when starting a new line
set autoindent

" Number of spaces for each auto-indent step. Also it affects what happens when
" you press >>, << or ==.
set shiftwidth=4

set softtabstop=4

" automatically inserts one extra level of indentation in structured files
" such as the source files.
" set smartindent Disabled for now

" Cursorcolumn highlight
set cursorcolumn

" Code folding
set foldmethod=indent
set foldlevel=99


