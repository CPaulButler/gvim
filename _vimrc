set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if &sh =~ '\<cmd'
    silent execute '!""C:\Program Files\Vim\vim63\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
  else
    silent execute '!C:\Program" Files\Vim\vim63\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  endif
endfunction

"The function NewFile, in conjunction with the autocommand below for the 
"BufNewFile event, will read a skeleton file as a starting point.  If 
"the file name starts with "Pkg", the function reads a skeleton package 
"file, otherwise it reads a skeleton entity file.  In either case, the 
"following substitution replaces the skeleton's package or entity name 
"with the name of the new file.
function NewFile()
  if match ( fnamemodify ( bufname("%"), ":t:r"), "Pkg" ) == 0 
    0read C:/Program\ Files/Vim/vimfiles/Package.vhd
    silent %s/PkgNewPackage/\=fnamemodify(bufname("%"),":t:r")/g
  else
    0read C:/Program\ Files/Vim/vimfiles/Entity.vhd
    silent %s/NewEntity/\=fnamemodify(bufname("%"),":t:r")/g
  endif
  silent %s/\<TodaysDate\>/\=strftime("%d %b %Y")/
  silent %s/\<ThisYear\>/\=strftime("%Y")/
endfunction

"set nohls
set titlestring=%t%m%r
set nowrap
set ss=1  "scroll sideways 1 column at a time
set siso=10  "sideways scrolling begins 10 columns from the edge

set ignorecase
"set updatecount=0
set nobackup
set nowritebackup
set noswapfile

set textwidth=72
set ai
set popt=number:y,left:0mm,right:0mm,top:0mm,bottom:0mm

set sts=12
set shiftwidth=2
set expandtab
set smarttab 
" smarttab will cause the <Tab> key to insert 'shiftwidth' 
" positions at the beginning of a line, but it will insert 'tabstop' (or 
" 'softtabstop') positions in other places.  This is useful for aligning 
" ':' characters in port declarations

" The 'columns' and 'rows' variables configure the initial size of the gvim window.
" The default value for 'columns' is 80
"set columns=100
set lines=40

  set fo=""
  set fo+=t  "Auto-wrap text using textwidth
  set fo+=c "Auto-wrap comments
  set fo+=r "Automatically insert comment after <Enter>
  set fo+=o "Auto insert comment after 'o' or 'O'
  set fo+=q "Allow formatting of comments with gq
  set fo+=w "Trailing white space indicates a paragraph continues
  set fo-=a "Automatic formatting of paragraphs
  set fo+=n "Recognize numbered lists
  set fo+=l "Don't break long lines that were longer than 'textwidth' 
            "when the insert command started.
            
  set autoindent
  set autoread "automatically reload the file if changed outside vi

"map | to remove trailing whitespace on otherwise empty lines.  This is 
"different from removing trailing whitespace from all lines.  Keeping 
"all-white lines empty allows vim cursor movements { and } to work well.  
"Removing trailing whitespace from a commented line interferes with 
"vim's reformat command:  gq.
map \| :%s/^ \+$//  

set ruler "Enable cursor position display at lower-right

setglobal spelllang=en_us
setglobal nospell
setlocal nospell

"colorscheme koehler
"colorscheme default

:autocmd BufNewFile *.vhd call NewFile()
  "Macro to check out files from perforce
  function! FPerforce()
    " use the regular expression comparison to see if the current 
    " directory is on P:.  If the directory is anywhere else, assume we 
    " should use the client designed for the gvim files.
    if getcwd() =~ "^P:" 
      let l:client = $nibuild_perforce_clientspec
      let l:port = 'perforce:1666'
    elseif getcwd() =~ "^S:"
      let l:client = $nibuild_penguin_clientspec
      let l:port = 'penguin:1666'
    else
      let l:client = "butler-Treehouse-gvim"
    endif
    silent execute "!p4 -p " . l:port . " -c " . l:client . " edit ""%"" "
  endfunction

  map  :call FPerforce()

  imap <expr> <C-_> "\uaf"

  set showbreak=____
  set linebreak

set guifont=Lucida_Console:h8:cANSI

