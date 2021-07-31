call plug#begin('~/.local/share/nvim/plugged')

" Utilities
Plug 'dense-analysis/ale'                           " Static analysis / error lint
Plug 'tpope/vim-fugitive'                           " Git Wrapper
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multi selection
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " LSP / Autocomplete
Plug 'junegunn/vim-easy-align'                      " Text alignment 
Plug 'sheerun/vim-polyglot'                         " Syntax highlighting and indentation support
" File Exploration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
" Lisp
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

call plug#end()

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
nnoremap <Leader>p :Buffers<CR>
nnoremap <c-p> :Files<CR>
" hide lastsatus (> fzf) on fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
 \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Rg
" :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
" :Rg! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
nnoremap <Leader>a :Rg<Space>
nnoremap <Leader>ag :Rg <C-R><C-W><CR>
vnoremap <Leader>ag y:Rg <C-r><C-r>"<CR>

" Fugitive
nnoremap <leader>g :Git<Space>

" Tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" COC.Nvim
let g:coc_global_extensions = ['coc-json', 'coc-conjure', 'coc-rust-analyzer', 'coc-tsserver', 'coc-eslint']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> fb <Plug>(coc-format)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>ax <Plug>(coc-codeaction-line)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <shift-control-a> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <s-c-a> coc#refresh()
else
  inoremap <silent><expr> <s-c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Show documentation on K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Sexp 

let g:sexp_mappings = {
         \ 'sexp_swap_list_backward':    '',
         \ 'sexp_swap_list_forward':     '',
         \ 'sexp_swap_element_backward': '',
         \ 'sexp_swap_element_forward':  '',
         \ }

lua require('init')
