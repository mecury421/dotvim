" ============================================
" = GENERAL
" ============================================

execute pathogen#infect()

" Default indentation settings (use spaces)
set ts=4 sts=4 sw=4 expandtab

" Enable colour syntax highlighting
syntax on

" enable line numbers
set number relativenumber

" Show visible tabs and eols
set listchars=tab:▸\ ,eol:¬
set list

" Set colour scheme
colors blackboard

set laststatus=2
set mouse=a

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

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

    " ============================================
    " = MARK DOWN SYNTAX
    " ============================================
    autocmd BufNewFile,BufReadPost *.mkd,*.markdown,*.md set filetype=mkd

    " ============================================
    " = GO SYNTAX
    " ============================================
    autocmd BufNewFile,BufReadPost *.go set filetype=go

    " autocmd vimenter * NERDTree

    " NERD Tree configuration
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    map <C-n> :NERDTreeToggle<CR>

endif

" ============================================
" = GOOGLE PROTOCOL BUFFER SYNTAX
" ============================================

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

