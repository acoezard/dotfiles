highlight clear 

if exists("syntax_on") 
	syntax reset 
endif

set background=dark


function!  Coloring(group,bg,fg,gui, cbg, cfg, c)
  let highlightstr = 'highlight ' . a:group . ' '
  let highlightstr .= 'guibg=' . a:guibg . ' '
  let highlightstr .= 'guifg=' . a:guifg . ' '
  let highlightstr .= 'gui=' . a:gui . ' '
  let highlightstr .= 'ctermbg=' . a:cbg . ' '
  let highlightstr .= 'ctermfg=' . a:cfg . ' '
  let highlightstr .= 'cterm=' . a:c . ' '

  execute histring
endfunction

call Coloring("Normal", #23272E, "NONE", "NONE", "NONE", "NONE")
call Coloring("Comment", "NONE", #768390, "bold", "NONE", "9")
call Coloring("Statement", "NONE", #6CB6FF, "NONE", "NONE", "9")
call Coloring("Type", "NONE", #6CB6FF, "NONE", "NONE", "9")
