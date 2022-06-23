source ~/.vim/rcs/common.vimrc" Load common vim settings

" Display
set number			" line numbering
set ruler			" show cursor position in bottom right of window
set cursorline		" highlights line that has cursor

" whitespace settings
set list
set listchars=tab:\»\ ,trail:∙

" highlight json files as javascript (partial solution)
autocmd BufNewFile,BufRead *.json set ft=javascript
