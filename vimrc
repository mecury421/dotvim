" ============================================
" = GENERAL
" ============================================

" Default indentation settings (use spaces)
set ts=4 sts=4 sw=4 noexpandtab

" enable line numbers
set nu

" Show visible tabs and eols
" set list
set listchars=tab:▸\ ,eol:¬

" Set colour scheme
colors blackboard

" ============================================
" = CUSTOM KEY MAPPING
" ============================================

" use custom leader
let mapleader=","

" quick switch of list
nmap <leader>l :set list!<CR>


" ============================================
" = AUTOCMD SETTINGS
" ============================================

" Check that we have autocmd installed
if has("autocmd")

    " enable file type detection
    filetype on
    
    " setup file type indentation settings
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

    " reload the vimrc file if we have just made changes to it!
    autocmd bufwritepost .vimrc source $MYVIMRC
endif


