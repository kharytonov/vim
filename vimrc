execute pathogen#infect()

" Remove ALL autocommands for the current group. When the .vimrc file is
" sourced twice, the autocommands will appear twice.  To avoid this, put this
" command in your .vimrc file, before defining autocommands: Also include it
" within augroup
autocmd!

" Resore cursor to the last position when reopening file
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EOL formats to try.
set ffs=unix,dos,mac
" Character encoding and do not set BOM
set encoding=utf8

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

" Allow backspacing over anything
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""
" Highlight lines longer than 80 chars "
""""""""""""""""""""""""""""""""""""""""

autocmd FileType python,xml highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python,xml match OverLength /\%121v.\+/

" Highlight weird characters on :set list
:highlight ExtraWhitespace ctermbg=red guibg=red
" This line is to make sure group is not overwritten by ColorScheme commands
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Show leading whitespace that includes spaces, and trailing whitespace.
:autocmd BufWinEnter * 2match ExtraWhitespace /\s\+$\| \+\ze\t/
" This is to disable highlighting while typing
:autocmd InsertEnter * 3match ExtraWhitespace /\s\+\%#\@<!$/
" This is to reenable back highlughting when exited from insert mode
:autocmd InsertLeave * 2match ExtraWhitespace /\s\+$\| \+\ze\t/
" This is to not allow memory leak in VIM due to a bug
:autocmd BufWinLeave * call clearmatches()

" This is to show hidden characters
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2
" Will automatically reflect the buffer which you are working on.
set title
" Enable mouse. Use <Shift> and mouse to make selection to copy to clipboard.
" set mouse=a
" Enable the mouse while running within GNU Screen
"set ttymouse=xterm2
" Set history to X lines
set history=700
" Display numbers
set number
" Map F3 to toggle numbers
nnoremap <F3> :set invnumber<CR>
" Show line and column position
set ruler
" Set background to dark
" set background=dark

" Set collor scheme
colorscheme ir_black
map <F10> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
" Tab configuration
map <leader>tn  :tabnew<cr>
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

" Easily indent code blocks by keeping them highlighted. Usually after the
" first indent the highlight is removed.
vnoremap < <gv
vnoremap > >gv
" Search for visually selcted text
vnoremap // y/<C-R>"<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups & Undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable vim's famous swap file :)
set noswapfile
