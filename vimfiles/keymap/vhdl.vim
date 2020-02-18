" Vim Keymap file for VHDL, specifies special characters handy for 
" drawing waveforms in comments.
" Maintainer: Paul Butler
" Last Change: 2006 Aug 24

" This file started as the accents.vim file.  I don't know what the 
" following stuff means so I'm commenting out the 'scriptencoding' line
" All characters are given literally, conversion to another encoding (e.g.,
" UTF-8) should work.
" scriptencoding latin1

" Use this short name in the status line.
let b:keymap_name = "VHDL"

" The mapping for <CTRL>_ is to the key sequence for the MACRON 
" character (ASCII 127 decimal, 0xaf hex).  It's the 'over-bar' 
" character and is perfect for creating waveforms that are only one row 
" high.
loadkeymap
              'm
