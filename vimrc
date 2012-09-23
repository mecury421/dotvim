" ============================================
" = GENERAL
" ============================================

" Default indentation settings (use spaces)
set ts=4 sts=4 sw=4 expandtab

" enable line numbers
set nu

" Show visible tabs and eols
set listchars=tab:▸\ ,eol:¬
set list

" Set colour scheme
colors blackboard

" ============================================
" = CUSTOM KEY MAPPING
" ============================================

" use custom leader
let mapleader=","

" quick switch of list
nmap <leader>l :set list!<CR>

" enable multiple pasting
xnoremap p pgvy

" enable highlighting of trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" sort out my common mistakes
cmap W w
cmap Q q
cmap Wq wq

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

" ============================================
" = GOOGLE PROTOCOL BUFFER SYNTAX
" ============================================

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

