" This my vimrc has been collected from the vast reaches of the 'net.
"
"   See also: http://pinboard.in/u:noah
"
"   ``VIM is the greatest editor since the stone chisel.''
"                                     
"                               - Jose Unpingco
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " use vim defaults (not vi); !MUST BE FIRST LINE!
set novb t_vb=          " neither bell nor vbell
set confirm             " ask for confirmation on overwrite, discard changes, etc
set mouse=a             " enable mouse in all modes
set fileencoding=utf-8 
set timeoutlen=0        " time to wait after ESC
set history=400         " number of lines of Ex command history to save
set hidden              " allow to change buffer w/o saving
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



""" Pathogen
""" http://www.vim.org/scripts/script.php?script_id=2332

call pathogen#runtime_append_all_bundles() 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on                     " enable filetype plugins
filetype indent on
filetype plugin on
filetype plugin indent on
set t_Co=256                    " use 256 terminal colors
set background=dark             " background color
syntax on                       " syntax highlighting on
"colorscheme wombat256
"colorscheme beauty256
" colorscheme jellybeans
" colorscheme lettuce
" colorscheme 256-jungle
" colorscheme desert256
" colorscheme gardener
" colorscheme inkpot
" colorscheme tir_black
"colorscheme summerfruit256
" colorscheme up
" colorscheme vilight
" colorscheme xoria256
colorscheme fu

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

" split windows correctly
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
set ignorecase            " case ignored in search
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
set foldmethod=manual     " manual, marker, syntax, try set foldcolumn=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always open command line window
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i

" use 20 screen lines for command-line window
set cmdwinheight=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " line numbers on
set ruler                 " show cursor coords
set vb t_vb=              " neither beep nor flash
set scrolloff=3           " minimum number of lines above/below cursor (when scrolling)
map <silent> <F14>   :let &number=1-&number<CR>
set laststatus=2          " always show the status line
set showcmd               " Show (partial) command in the last line of the screen.
set title                 " window title
set ttyfast               " improves smoothness

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation, tab/space
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab             
" Copy indent from current line when starting a new line (via <CR> or "o")
set autoindent
" Number of spaces to use for autoindent (and >> <<)
set shiftwidth=2
" smart indenting for new lines
set smartindent
" number of spaces that a tab counts for
set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always open NERDTree explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

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
function AutoModeChange()
  " Automatically give executable permissions if file begins with #!
  " and contains '/bin/' in the path
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

" GPG Stuff
let g:GPGUseAgent = 1

if has("gui_running")
  set guifont=dina\ 10
  set novb t_vb=          " neither bell nor vbell
  " fix Shift+Insert.  Note: these won't work with :set paste
  "noremap <S-Insert> "+gP
  "inoremap <S-Insert> <ESC>"+gP
  "let g:solarized_termcolors=256
  "colorscheme solarized
  " Make shift-insert work like in Xterm
  nnoremap  <S-Insert> <MiddleMouse>
  "conqueterm
  let g:ConqueTerm_PyVersion = 2
  let g:ConqueTerm_FastMode = 0
  let g:ConqueTerm_Color = 1
  let g:ConqueTerm_SessionSupport = 0
  let g:ConqueTerm_ReadUnfocused = 1
  let g:ConqueTerm_InsertOnEnter = 0
  let g:ConqueTerm_CloseOnEnd = 0
  let g:ConqueTerm_StartMessages = 0
  let g:ConqueTerm_ToggleKey = '<F8>'
  let g:ConqueTerm_Syntax = 'conque'
  let g:ConqueTerm_CWInsert = 1
  let g:ConqueTerm_ExecFileKey = '<F11>'
  let g:ConqueTerm_SendFileKey = '<F10>'
  let g:ConqueTerm_SendVisKey = '<F9>'
  let g:ConqueTerm_TERM = 'vt100'
endif

""" PYTHON
let python_highlight_all = 1
autocmd BufRead,BufNewFile *.py set tabstop=4 expandtab shiftwidth=4 softtabstop=4 

autocmd BufRead,BufNewFile *.textile set tw=0 spell spelllang=en_us

set makeprg=scons


" Make shift-insert work like in Xterm
nnoremap  <S-Insert> <MiddleMouse>
