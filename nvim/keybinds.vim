" INSERT mode

    inoremap jk <Esc>
    inoremap kj <Esc>

" --------------------------------------
" VISUAL mode
" don't leave visual mode when (un)indenting
    vnoremap < <gv
    vnoremap > >gv

" move text up and down
    vnoremap <A-j> :m .+1<CR>==
    vnoremap <A-k> :m .-2<CR>==

" Keep the pasted text in the register
    vnoremap p     '"_dP'

" --------------------------------------
" VISUAL BLOCK mode

" Move text up and down
    xnoremap J     :move '>+1<CR>gv-gv
    xnoremap K     :move '<-2<CR>gv-gv
    xnoremap <A-j> :move '>+1<CR>gv-gv
    xnoremap <A-k> :move '<-2<CR>gv-gv

" --------------------------------------
" NORMAL mode
" Easy hjkl window navigation
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l

" Switch Buffer with window keys
    noremap <C-Up>              :resize -2<CR>
    noremap <C-Down>            :resize +2<CR>
    noremap <C-Left>  :vertical :resize -2<CR>
    noremap <C-Right> :vertical :resize +2<CR>

" navigate between buffers
    noremap <S-l> :bnext<CR>
    noremap <S-h> :bprevious<CR>

" --------------------------------------   
" TERMINAL mode
    tnoremap <Esc> <C-\><C-n>