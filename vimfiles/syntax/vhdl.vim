" Modified to suit my own preferences and checked into P4 through a link
" at //Misc/users/butler/Experiment/Misc/vhdl.vim

" Vim syntax file
" Language:	VHDL
" Maintainer:	Czo <Olivier.Sirol@lip6.fr>
" Credits:	Stephan Hegel <stephan.hegel@snc.siemens.com.cn>
" $Id: vhdl.vim,v 1.9 2000/04/06 10:13:09 czo Exp $

" VHSIC Hardware Description Language
" Very High Scale Integrated Circuit

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" This is not VHDL. I use the C-Preprocessor cpp to generate different binaries
" from one VHDL source file. Unfortunately there is no preprocessor for VHDL
" available. If you don't like this, please remove the following lines.
syn match cDefine "^#ifdef[ ]\+[A-Za-z_]\+"
syn match cDefine "^#endif"

" case is not significant
syn case ignore

" VHDL keywords
syn keyword vhdlStatement access after alias all assert
syn keyword vhdlStatement architecture array attribute
syn keyword vhdlStatement begin block body buffer bus
syn keyword vhdlStatement case component configuration constant
syn keyword vhdlStatement disconnect downto
syn keyword vhdlStatement elsif end entity exit
syn keyword vhdlStatement file for function
syn keyword vhdlStatement generate generic group guarded
syn keyword vhdlStatement impure in inertial inout is
syn keyword vhdlStatement label library linkage literal loop
syn keyword vhdlStatement map
syn keyword vhdlStatement new next null
syn keyword vhdlStatement of on open others out
syn keyword vhdlStatement package port postponed procedure process pure
syn keyword vhdlStatement range record register reject report return
syn keyword vhdlStatement select severity signal shared
syn keyword vhdlStatement subtype
syn keyword vhdlStatement then to transport type
syn keyword vhdlStatement unaffected units until use
syn keyword vhdlStatement variable wait when while with
syn keyword vhdlStatement note warning error failure

syn keyword pslKeyword assume assume_guarantee cover default fairness 
syn keyword pslKeyword property restrict restrict_guarantee sequence 
syn keyword pslKeyword strong vmode vprop vunit

" Special match for "if" and "else" since "else if" shouldn't be highlighted.
" The right keyword is "elsif"
syn match   vhdlStatement "\<\(if\|else\)\>"
syn match   vhdlNone      "\<else\s\+if\>$"
syn match   vhdlNone      "\<else\s\+if\>\s"

" Predifined VHDL types
syn keyword vhdlType bit bit_vector
syn keyword vhdlType character boolean integer real time
syn keyword vhdlType string severity_level
" Predifined standard ieee VHDL types
syn keyword vhdlType positive natural signed unsigned
syn keyword vhdlType line text
syn keyword vhdlType std_logic std_logic_vector
syn keyword vhdlType std_ulogic std_ulogic_vector
" Predefined non standard VHDL types for Mentor Graphics Sys1076/QuickHDL
syn keyword vhdlType qsim_state qsim_state_vector
syn keyword vhdlType qsim_12state qsim_12state_vector
syn keyword vhdlType qsim_strength
" Predefined non standard VHDL types for Alliance VLSI CAD
syn keyword vhdlType mux_bit mux_vector reg_bit reg_vector wor_bit wor_vector

" array attributes
syn match vhdlAttribute "\'high"
syn match vhdlAttribute "\'left"
syn match vhdlAttribute "\'length"
syn match vhdlAttribute "\'low"
syn match vhdlAttribute "\'range"
syn match vhdlAttribute "\'reverse_range"
syn match vhdlAttribute "\'right"
syn match vhdlAttribute "\'ascending"
" block attributes
syn match vhdlAttribute "\'behaviour"
syn match vhdlAttribute "\'structure"
syn match vhdlAttribute "\'simple_name"
syn match vhdlAttribute "\'instance_name"
syn match vhdlAttribute "\'path_name"
syn match vhdlAttribute "\'foreign"
" signal attribute
syn match vhdlAttribute "\'active"
syn match vhdlAttribute "\'delayed"
syn match vhdlAttribute "\'event"
syn match vhdlAttribute "\'last_active"
syn match vhdlAttribute "\'last_event"
syn match vhdlAttribute "\'last_value"
syn match vhdlAttribute "\'quiet"
syn match vhdlAttribute "\'stable"
syn match vhdlAttribute "\'transaction"
syn match vhdlAttribute "\'driving"
syn match vhdlAttribute "\'driving_value"
" type attributes
syn match vhdlAttribute "\'base"
syn match vhdlAttribute "\'high"
syn match vhdlAttribute "\'left"
syn match vhdlAttribute "\'leftof"
syn match vhdlAttribute "\'low"
syn match vhdlAttribute "\'pos"
syn match vhdlAttribute "\'pred"
syn match vhdlAttribute "\'rightof"
syn match vhdlAttribute "\'succ"
syn match vhdlAttribute "\'val"
syn match vhdlAttribute "\'image"
syn match vhdlAttribute "\'value"

syn keyword vhdlBoolean true false

" for this vector values case is significant
syn case match
" Values for standard VHDL types
syn match vhdlVector "\'[0L1HXWZU\-\?]\'"
" Values for non standard VHDL types qsim_12state for Mentor Graphics Sys1076/QuickHDL
syn keyword vhdlVector S0S S1S SXS S0R S1R SXR S0Z S1Z SXZ S0I S1I SXI
syn case ignore

syn match  vhdlVector "B\"[01_]\+\""
syn match  vhdlVector "O\"[0-7_]\+\""
syn match  vhdlVector "X\"[0-9a-f_]\+\""
syn match  vhdlCharacter "'.'"
syn region vhdlString start=+"+  end=+"+

" floating numbers
syn match vhdlNumber "-\=\<\d\+\.\d\+\(E[+\-]\=\d\+\)\>"
syn match vhdlNumber "-\=\<\d\+\.\d\+\>"
syn match vhdlNumber "0*2#[01_]\+\.[01_]\+#\(E[+\-]\=\d\+\)\="
syn match vhdlNumber "0*16#[0-9a-f_]\+\.[0-9a-f_]\+#\(E[+\-]\=\d\+\)\="
" integer numbers
syn match vhdlNumber "-\=\<\d\+\(E[+\-]\=\d\+\)\>"
syn match vhdlNumber "-\=\<\d\+\>"
syn match vhdlNumber "0*2#[01_]\+#\(E[+\-]\=\d\+\)\="
syn match vhdlNumber "0*16#[0-9a-f_]\+#\(E[+\-]\=\d\+\)\="
" operators
syn keyword vhdlOperator and nand or nor xor xnor
syn keyword vhdlOperator rol ror sla sll sra srl
syn keyword vhdlOperator mod rem abs not
syn match   vhdlOperator "[&><=:+\-*\/|]"
syn match   vhdlSpecial  "[().,;]"
" time
syn match vhdlTime "\<\d\+\s\+\(\([fpnum]s\)\|\(sec\)\|\(min\)\|\(hr\)\)\>"
syn match vhdlTime "\<\d\+\.\d\+\s\+\(\([fpnum]s\)\|\(sec\)\|\(min\)\|\(hr\)\)\>"

"syn match vhdlComment "--.*$"
syn region vhdlComment matchgroup=xCommentStart start="--" end="$"

" syn region vhdlComment start="^\s\+--" end="^\s*[^-]"
" syn match vhdlGlobal "[\'$#~!%@?\^\[\]{}\\]"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_vhdl_syntax_inits")
  if version < 508
    let did_vhdl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cDefine       PreProc
  HiLink vhdlSpecial   Special
  HiLink vhdlStatement Statement
  HiLink pslKeyword    Statement
  HiLink vhdlCharacter String
  HiLink vhdlString    String
  HiLink vhdlVector    String
  HiLink vhdlBoolean   String
  HiLink vhdlComment   Comment
  HiLink vhdlCommentStart   Operator
  HiLink vhdlNumber    String
  HiLink vhdlTime      String
  HiLink vhdlType      Type
  HiLink vhdlOperator  Type
  HiLink vhdlGlobal    Error
  HiLink vhdlAttribute Type

  delcommand HiLink
endif

let b:current_syntax = "vhdl"

" vim: ts=8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Homemade functions and keymaps:                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  function! FMinimum(Arg1, Arg2)
    return (a:Arg1 < a:Arg2) ? a:Arg1 : a:Arg2
  endfunction
    
  function! FIndent(LineNum)
    " returns the byte offset of the first non-white space character on
    " line LineNum
    return match(getline(a:LineNum),"\\S")
  endfunction
  
  function! FMinIndent(Start, End)
    let Shortest = 1000
    let Current = a:Start
    while Current <= a:End
      "go to next line
      execute Current 

      "if current line is not empty
      if col("$") > 1
        " compare against previously shortest line
        let Shortest = FMinimum(indent(Current), Shortest)
      endif
      let Current = Current + 1
    endwhile

    return Shortest
  endfunction

  function! FToggleCommentLine(AddComment, Indent)

    if a:AddComment
      "if the line is shorter than the indentation, add some white space
      if col("$") < a:Indent
        execute "normal ".a:Indent."a "
      endif

      if a:Indent > 0
        let MatchPattern = "\\(.\\{".(a:Indent)."}\\)"
      else
        let MatchPattern = "^"
      endif

      let Replacement = "\\1--"
    else
      if a:Indent > 0
        let MatchPattern = "\\(.\\{".(a:Indent)."}\\)--"
      else
        let MatchPattern = "^--"
      endif
      let Replacement = "\\1"
    endif

    execute "s/".MatchPattern."/".Replacement."/"
  endfunction

  function! FNoTrailingSpace()
    s/\s*$//
  endfunction

  function! FGlobalNTS()
    %call FNoTrailingSpace()
  endfunction

  function! FToggleComment() range
     execute (a:firstline) "," (a:lastline) "call FNoTrailingSpace()"
     let Indent = FMinIndent(a:firstline, a:lastline)

     " if the first line doesn't start with a comment, we'll add
     " comments to every line in the range
     let AddComment = (match(getline(a:firstline),"^\\s*--") == -1)

     execute (a:firstline) "," (a:lastline) 'call FToggleCommentLine(' AddComment ',' Indent ')'

  endfunction
  
  function! FVScan()
     let fVScanCommentString = getline(".")
     let fVScanCommentString = substitute(fVScanCommentString, "^\\(\\s*\\)\\([^ ]\\)", "\\1--vscan \\2", "")
     call setline(line("."), fVScanCommentString)
     unlet fVScanCommentString
  endfunction
      
  function! FBlockCommentLine(LineLen,Indent)

    " append many spaces to ensure that the line is long enough            

    " Find line length:
    "   Step 1:  Remove trailing spaces
    call FNoTrailingSpace()
    "   Step 2:  Record the length of the current line
    let CurrentLineLen=col("$")-1

    if (a:Indent) == 0
      "When not indenting, comment the line
      s/^/-- /
    else
      if CurrentLineLen < a:Indent
        execute "normal $".(a:Indent - CurrentLineLen)."a "
      endif

      "When indenting, insert an indented comment
      execute 's/\(\s\{'.(a:Indent).'}\)\(.*\)/\1-- \2/'
    endif

    "We just made the line 3 characters longer
    let CurrentLineLen = CurrentLineLen + 3

    "End the line with '--':
    if a:LineLen > CurrentLineLen
      "Append a bunch of white space at the end of the line
      execute "normal $".(a:LineLen)."a "
      "Truncate the end of the line with '--'
      execute 's/\(.\{'.(a:LineLen-3).'}\).*/\1 --/'
    else
      "Append ' --' to the end of the current line
      execute 'normal $a --'
    endif

  endfunction

  function! FBlockComment() range
     " LineLen controls the width of the comment box.
     " &columns has the value equal to the display width.  Use that
     " value to automatically draw a comment box as wide as the display
     "let LineLen = &columns
     
     let LineLen = 80
     execute (a:firstline) "," (a:lastline) "call FNoTrailingSpace()"
     let Indent = FMinIndent(a:firstline, a:lastline)

     let SavedFO = &formatoptions

     "This will prevent potentially long lines from being "wrapped"
     set formatoptions=""

     execute (a:firstline) "," (a:lastline) 'call FBlockCommentLine(' LineLen ',' Indent ')'

     " insert a line of '-' before and after the selection
     execute 'normal '.(a:firstline).'GO'.(LineLen).'a-'
     execute 'normal '.(a:lastline+1).'Go'.(LineLen).'a-'

     if Indent != 0
       " replace beginning of new lines (already filled with '-') with
       " enough spaces to match the indent level of the block
       execute 'normal '.(a:firstline).'G'.(Indent).'r '
       execute 'normal '.(a:lastline+2).'G'.(Indent).'r '
     endif

     execute "set formatoptions=".SavedFO
  endfunction

  function! FUnblock() range
    "Delete leading comment characters
    execute (a:firstline).",".(a:lastline).'s/-- //'

    "Delete trailing comment characters
    execute (a:firstline).",".(a:lastline).'s/\s*--\s*$//'

    "Delete lines filled with comment characters
    execute (a:firstline).'g/\s*-\+\s*$/d'
    execute (a:lastline - 1).'g/\s*-\+\s*$/d'
  endfunction

  function! FBlockCommentToggle() range
    let LineOne=getline(a:firstline)
    let IsCommented = (match(LineOne, '^\s*--') != -1)

    if IsCommented
      execute (a:firstline)."," (a:lastline)"call FUnblock()"
    else
      execute (a:firstline)."," (a:lastline)"call FBlockComment()"
    endif
  endfunction

  " VisualBlockToggle is designed only to operate in visual mode and 
  " should be mapped to a hotkey using the 'vmap' command.  It adds or 
  " removes block-style comments to the selected range.
  function! VisualBlockToggle() range

    let LineOne=getline(a:firstline)
    "if the first commented line in the block is a line containing
    "only white space and '-' characters, this must be a block comment
    let IsCommented = (match(LineOne, "^\\s*--\\+\\s*$") != -1)

    if IsCommented
      "Remove the block-style comment characters on every line in the
      "segmment.
      execute (a:firstline).",".(a:lastline)."call FUnblock()"

      "Place the cursor on the last line in the range.  This assumes
      "that the first and last lines have been deleted because they
      "contained only white space and a contiguous sequence of '-'
      "characters
      execute "normal" ((a:lastline)-2)."G"
    else
      "Place a block comment around the selected text
      execute (a:firstline)."," (a:lastline)"call FBlockComment()"

      "Place the cursor on the last line of the comment.  The +2 is to
      "compensate for the new lines filled with '-' characters
      execute ((a:lastline)+2)
    endif
  endfunction

  " FindBlockToggle tries to find the beginning and end of the block 
  " where the cursor begins and removes or adds block style comments by  
  " calling VisualBlockToggle.  This should be mapped to a hotkey using 
  " the 'map' command but not the 'vmap' command.
  function! FindBlockToggle() range

    let LineOne=getline(a:firstline)
    let IsCommented = (match(LineOne, "^\\s*--") != -1)

    if IsCommented
      "search backwards to find the first commented line in this block
      let BlockStart=search("^\\(\\s*--\\)\\@!","bW") + 1

      "if the first commented line in the block is a line containing
      "only white space and '-' characters, this must be a block comment
      let LineOne=getline(BlockStart)
      let IsCommented = (match(LineOne, "^\\s*--\\+\\s*$") != -1)
    endif

    if IsCommented
      "If the first line in the range is commented, find the beginning
      "and end of the segment and then remove the comment characters on
      "every line

      "go to the first line in the selected range
      execute (a:firstline)

      "search backwards (without wrapping) to the first line that
      "doesn't begin with a comment.  This will be the line before the
      "commented segment.  Add 1 to point to the first line in the
      "commented segment.
      let BlockStart=search("^\\(\\s*--\\)\\@!","bW") + 1

      "go to the last line in the selected range
      execute (a:lastline)

      "search forward (without wrapping) to the next uncommented line.
      "Subtract 1 to find the last commented line.
      let BlockEnd=search("^\\(\\s*--\\)\\@!","W")-1

      "Remove the block-style comment characters on every line in the
      "segmment.
      execute (BlockStart).",".(BlockEnd)."call FUnblock()"

      "Place the cursor on the last line in the range.  This assumes
      "that the first and last lines have been deleted because they
      "contained only white space and a contiguous sequence of '-'
      "characters
      execute "normal" (BlockEnd-2)."G"
    else

      "Go to the first line in the selected range
      execute (a:firstline)

      "Move backwards to a paragraph break using the '{' motion.  Move
      "down one line using the 'j' motion to place the cursor on the
      "first line of text.
      execute "normal {j"
      let BlockStart=line(".")

      "Go to the last line in the selected range
      execute (a:lastline)

      "Move forward to a paragraph break using the '}' motion.  Move
      "up one line using the 'k' motion to place the cursor on the
      "last line of text.
      execute "normal }k"
      let BlockEnd=line(".")

      "Place a block comment around the selected text
      execute (BlockStart)."," (BlockEnd)"call FBlockComment()"

      "Place the cursor on the last line of the comment.  The +2 is to
      "compensate for the new lines filled with '-' characters
      execute (BlockEnd+2)
    endif

  endfunction

  " map keys to macros
  map  :call FToggleComment()<CR>0
  vmap  :call FToggleComment()<CR>0
  
  map <F2> :call FBlockComment()<CR>0
  vmap <F2> :call FBlockComment()<CR>0

  map <F3> :call FUnblock()<CR>0
  vmap <F3> :call FUnblock()<CR>0

  map <F4> :call FGlobalNTS()<CR>0
  vmap <F4> :call FGlobalNTS()<CR>0

  map <F5> :call FindBlockToggle()<CR>0
  vmap <F5> :call VisualBlockToggle()<CR>0

  " ':--' defines a single-line comment header as "--"
  " 's:--(' defines a multiline comment header as '--('
  " 'mb:--' defines a multiline, middle line header as '--'
  " 'ex:--)' defines the last line of a multiline comment as '--)'
  set comments=:--vscan\ #,:--vscan,:--\ CPB\:,:--,s:--(,mb:--,ex:--)

  " for folding, cms defines the fold marker format as --%s
  set cms=--%s

  set fo=""
  set fo-=t  "Auto-wrap text using textwidth
  set fo+=c "Auto-wrap comments
  set fo+=r "Automatically insert comment after <Enter>
  set fo+=o "Auto insert comment after 'o' or 'O'
  set fo+=q "Allow formatting of comments with gq
  set fo+=w "Trailing white space indicates a paragraph continues
  set fo-=a "Automatic formatting of paragraphs
  set fo-=n "Recognize numbered lists
  set fo+=l "Don't break long lines that were longer than 'textwidth' 
            "when the insert command started.
            
  set autoindent

  "This is the path to search when executing the gf command.  **
  "searches all the subdirectories.  ; means to search up instead of
  "down.  A directory following the ; is the stop folder.  Study the
  "manual before modifyng this value:
  set path=.,'',**;

  "I remove the '.' from isfname so that 'gf' works when the cursor is
  "over the package name in "use WORK.PkgNiUtilities.all"
  "For some reason, I cannot remove the '.' from isfname unless I first
  "remove the '\' from isfname.  I add the '\' back when I'm done:
  set isfname-=\
  set isfname-=.
  set isfname+=\

  "suffixesadd lists filename extensions to try when execute the gf
  "command
  set suffixesadd=.vhd,.vhdl,.v

  "This doesn't work but I don't feel like figuring out how to fix it
  "right now.  My goal was to never find files in the vwork folder
  set wildignore=vwork/*.vhd

  map gf :find <cfile>.vhd

