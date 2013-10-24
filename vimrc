"
"   ``VIM is the greatest editor since the stone chisel.''
"                                     
"                               - Jose Unpingco
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 
let mapleader = ","
let g:mapleader = ","

set nocompatible        " use vim defaults (not vi); required!
filetype off            " required!

"" set up consolidated swap, if necessary
let swapdir="/tmp/vim_swap"
if !isdirectory(expand(swapdir))
  echo "Creating swap directory " . swapdir
  call mkdir(swapdir)
endif
let &backupdir=swapdir
let &directory=swapdir

" install vundle if we don't have it already; it's a git submodule
let missing_vundle=0
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  echo "Installing vundle"
  echo ""
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let missing_vundle=1
endif

" load vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" vundles
Bundle 'airblade/vim-gitgutter'
Bundle 'davidhalter/jedi-vim'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'mileszs/ack.vim'
Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'
Bundle 'git://github.com/Shougo/neocomplcache.git'
Bundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'jpalardy/vim-slime'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
"#Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'majutsushi/tagbar'
Bundle 'noah/vim256-color'
Bundle 'nvie/vim-flake8'
"Bundle 'Raimondi/delimitMate'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'ap/vim-css-color'
Bundle 'sjl/gundo.vim'
Bundle 'timcharper/textile.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vimoutliner/vimoutliner'
Bundle 'vim-scripts/bclear'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/ScrollColors'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/TWiki-Syntax'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/xml.vim'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/django.vim'


if missing_vundle
  echo "Updating bundles"
  echo ""
  :BundleInstall
endif

"Bundle 'altercation/vim-colors-solarized' "T-H-E colorscheme

syntax on
filetype on
filetype plugin indent on     " required! 

set novb t_vb=          " neither bell nor vbell
set confirm             " ask for confirmation on overwrite, discard changes, etc
set mouse=a             " enable mouse in all modes
set history=400         " number of lines of Ex command history to save
set hidden              " allow to change buffer w/o saving
set shortmess=atI       " Disable the welcome screen and other verbosity

""" GNUPG
" GPG Stuff
let g:GPGUseAgent = 1
let g:GPGPreferArmor=1
let g:GPGDefaultRecipients=["0x33CD92CD87D46D8F069FDA40276347CD175D5344", "0x8A7BBF7BB3A949A853B668B0C3D7A4A522660FC3", "0x4FE5CAF4A19B4005CE3199952D7A4956D6656D4B" ]

" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   [%{&fo}] value of format-options
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer (smart, includes 'Top' and 'Bot'
"     markers)
"   %) end of width specification
set statusline=%<\ %n:%f\ %m%r%y[%{&fo}]%=%-35.(L\ %l\ /\ %L;\ C\ %c%V\ (%P)%)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encodings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &termencoding == ""
  let &termencoding = &encoding
endif

if exists("g:modifiable") " can only change fileencoding if set modifiable
  set encoding=utf-8
  set fileencoding=utf-8
  setglobal fileencoding=utf-8
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coding niceties
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim " intelligent matching of if/else blocks


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fonts, colors and syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on                     " enable filetype plugins
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on                       " syntax highlighting on

"colorscheme slate

let g:Powerline_symbols = "fancy"

let gvim = has("gui_running")
if gvim
  set linespace=1
  set guifont=Monaco\ 12
  set novb t_vb=          " neither bell nor vbell
  au GUIEnter * set t_vb= 
  " fix Shift+Insert.  Note: these won't work with :set paste
  "noremap <S-Insert> "+gP
  "inoremap <S-Insert> <ESC>"+gP
  "let g:solarized_termcolors=256
  "colorscheme solarized
  " Make shift-insert work like in Xterm
  nnoremap  <S-Insert> <MiddleMouse>
endif

"set background=dark             " background color
set background=light

if &term == "rxvt-unicode-256color" || &term == "screen-256color" || gvim
  set t_Co=256
  " use 256 terminal colors
  "
  "colorscheme wombat256
  "colorscheme beauty256
  " colorscheme jellybeans
  " colorscheme lettuce
  " colorscheme 256-jungle
  " colorscheme desert256
  " colorscheme gardener
  " colorscheme inkpot
  " colorscheme tir_black
  " colorscheme up
  " colorscheme vilight
  " colorscheme xoria256
  colorscheme fu
  "colorscheme summerfruit256
  "colorscheme nkt256 

  " toggle cursor color, modally
  let &t_SI = "\<Esc>]12;#fe021d\x7"
  let &t_EI = "\<Esc>]12;#00b4ff\x7"
  let &t_SI .= "\<Esc>[4 q\x7"
  let &t_EI .= "\<Esc>[2 q\x7"
  "silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal

  "if &term =~ '^xterm'
  "  " solid underscore
  "  let &t_SI .= "\<Esc>[4 q"
  "  " solid block
  "  let &t_EI .= "\<Esc>[2 q"
  "  " 1 or 0 -> blinking block
  "  " 3 -> blinking underscore
  "endif
endif


set showmatch             " show matching paren when bracked inserted

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set H and L to first and last character of line
map H ^
map L $
set whichwrap+=<,>,h,l    " allow cursor keys to wrap around columns


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easier switch between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" grow/shrink horizontal split windows with plus/minus keys
if bufwinnr(1)
  map - <C-W>-
  map + <C-W>+
endif

" split windows correctly/intuitively
set splitbelow " split new vertical buffers beneath current buffer
set splitright " split new horizontal buffers to the right of current buffer


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F6 -- paste 
set pastetoggle=<F6>    
" F7 -- spellchecking
map <F7> :setlocal spell! spelllang=en_us<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrapping, yo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maximum width of text that is being inserted.  A longer line will be 
" broken after white space to get this width.  A zero value disables this. 
set textwidth=72 
" This is a sequence of letters which describes how automatic formatting is 
" to be done.   See fo-table
set formatoptions=cqt 
set wrapmargin=0
set wrap                  " wrap lines
" make horizontal scrolling in wrap more useful
set sidescroll=5          
set listchars+=precedes:<,extends:>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and regex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch             " highlight where the typed pattern matches
set hlsearch              " highlight all searched-for phrases
"set ignorecase            " case ignored in search
set smartcase             " case ignored unless upper case used
set magic                 " magic on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu              " tab-complete Ex commands
set wildmode=list:longest,full
set completeopt=menu      " use popup menu to show completions
" autocomplete functions and identifiers for languages
"setlocal omnifunc=syntaxcomplete#Complete
"set omnifunc=syntaxcomplete#Complete " C-X C-O

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable          " open all folds
set foldmethod=indent " manual, marker, syntax, try set foldcolumn=2
set foldlevel=2
set foldnestmax=2
" fold bindings
nnoremap <space> za
vnoremap <space> zf

" save fold state between sessions
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always open command line window
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i

" use 20 screen lines for command-line window
set cmdwinheight=10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nonumber              " line numbers
set ruler                 " show cursor coords
set vb t_vb=              " neither beep nor flash
set scrolloff=20          " minimum number of lines above/below cursor (when scrolling)
map <silent> <F14>   :let &number=1-&number<CR>
set laststatus=2          " always show the status line
set showcmd               " Show (partial) command in the last line of the screen.
set title                 " window title
set ttyfast               " improves smoothness
"set relativenumber        " relative line numbering

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation, tab/space
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab             
" Copy indent from current line when starting a new line (via <CR> or "o")
set autoindent
" Number of spaces to use for autoindent (and >> <<)
"set shiftwidth=2
" smart indenting for new lines
"N.B. smartindent breaks python indent ('#'-comments annoyingly unindented  may need to selectively enable for other languages)
set smartindent 
" number of spaces that a tab counts for
set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always open NERDTree explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" Close nerd tree automatically if last and only buffer
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               AutoModeChange()
function! AutoModeChange()
  " Automatically set executable bit if file's first line contains #! and '/bin/'
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod 755 %
    endif
  endif
endfunction
au BufWritePost * call AutoModeChange()

" show scratch function prototype even when only one match
set cot+=menuone

" toggle line numbers with F12
map <F12> :set number!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let python_highlight_all = 1
autocmd FileType python set ai tabstop=4 expandtab shiftwidth=4 softtabstop=4 textwidth=78
autocmd FileType python map <buffer> <F8> :call Flake8()<CR>
"autocmd BufWritePost *.py call Flake8()
"autocmd BufRead *.py inoremap # X<c-h>#
"
au FileType ruby set expandtab softtabstop=2 tabstop=2 shiftwidth=2 autoindent

au FileType html set ft=htmldjango.html


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language-specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.textile set tw=0 spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex set spell spelllang=en_us ft=tex

autocmd BufRead,BufNewFile *.tex set ft=tex spell spelllang=en_us

au BufRead,BufNewFile /etc/nginx/conf/* set ft=nginx 

au FileType html,xml so ~/.vim/bundle/xml.vim/ftplugin/xml.vim

""" make ctrl+pg{up,dn} work in console vim
set t_kN=[6;*~
set t_kP=[5;*~


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight nota bene annotation ([nN].[bB].) (n.b. N.B.) like TODO and FIXME
" see :help match
match Todo @\cN\.B\.@


" Visual display of non-printing chars
" set listchars=nbsp:·,eol:⏎,extends:>,precedes:<,tab:\|\ 
" set list!


" for tmux
"map <C-h> gT
"map <C-l> gt

" vim-slime ...
let g:slime_target = "tmux"
let g:slime_paste_file = "/tmp/vim_swap/slime-paste-file"
let g:slime_no_mappings = 1
" real men use ipython
let g:slime_python_ipython = 1

xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeParagraphSend
nmap <leader>t <Plug>SlimeConfig

" supertab
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTab_tab = 1
"let g:SuperTabMappingForward = '<Tab>'
"let g:SuperTabMappingBackward = '<s-Tab>'


" Ctrl-p
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" Switch between the last two files
nnoremap <leader><leader> <c-^>


" notice file changes
set autoread


" fix movement in line-wrapped text
nmap j gj
nmap k gk


" backspace over stuff
set backspace=indent,eol,start

autocmd BufNewFile,BufReadPost mutt-* set textwidth=72 wrap spell spelllang=en_us
autocmd BufRead mutt-* 1;/^$/+
" vim -p glob argument limit
set tabpagemax=200

let g:syntastic_python_checkers = ['flake8']
"   spaces after (
"   spaces before :
"   spaces before operator
"   multiple statements on one line (colon)
"   multiple spaces after :
"   multiple spaces before keyword
"   line too long
"   spaces before inline comment
"   too many blank lines
"   whitespace after ','
"   whitespace around operators
"   continuation line oveindent
"   semicolon separating statements
"   indentation in continued lines
"   whitespace before ')'
let g:syntastic_python_flake8_post_args="--ignore=E201,E203,E221,E701,E241,E501,E225,E261,E303,E231,E122,E126,E128,E702,E202,E272,E271,E251,E302"


" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <C-S-O> :call <SID>SynStack()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Ctrl+Shift+Page{Up,Down} reorders tabs (a la google-chrome)
function <SID>MoveCurrentTab(value)
  if a:value == 0
    return
  endif
  let move = a:value - 1
  let move_to = tabpagenr() + move
  if move_to < 0
    let move_to = 0
  endif
  exe 'tabmove '.move_to
endfunction
"
" tab movement, reordering
noremap <C-S-PageDown> :call <SID>MoveCurrentTab(1)<cr>
noremap <C-S-PageUp>   :call <SID>MoveCurrentTab(-1)<cr>
noremap <C-h> gT
noremap <C-l> gt


" don't page output
set nomore


autocmd FileType c :call tagbar#autoopen(1)

set fileformats=unix

let g:Powerline_symbols='fancy'


" mapping for the sudo write trick
"
"command W w !sudo tee % > /dev/null
cmap w!! w !sudo tee > /dev/null %
