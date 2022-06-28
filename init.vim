"Plugin
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
call plug#end()

" Options
set encoding=utf-8
set hidden
set mouse=a
set nobackup
set nowritebackup
set number
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set tabstop=2
set termguicolors
set updatetime=300

" Coc settings
" Tab navigation
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Select item in enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Coc-prettier enable
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Pairs desabled characters
autocmd FileType html let b:coc_pairs_disabled = ['<']

" NERDTree keymaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-c> :NERDTreeClose<CR>

" Vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Switch buffer
nnoremap <A-,> :bprevious<CR>
nnoremap <A-.> :bnext<CR>

" Theme
colorscheme gruvbox
let g:gruvbox_contrast = 'hard'

" Set NERDTreeCommenter settings
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

" Terminal integration
if exists('g:loaded_floaterm')
  finish
elseif !has('nvim') && !has('terminal')
  call floaterm#util#show_msg("floaterm requires vim to be compiled with 'terminal'", "error")
  finish
endif
let g:loaded_floaterm = 1

let g:floaterm_shell            = get(g:, 'floaterm_shell', &shell)
let g:floaterm_title            = get(g:, 'floaterm_title', 'floaterm($1/$2)')
let g:floaterm_width            = get(g:, 'floaterm_width', 0.6)
let g:floaterm_height           = get(g:, 'floaterm_height', 0.6)
let g:floaterm_wintype          = get(g:, 'floaterm_wintype', 'float')
let g:floaterm_autoclose        = get(g:, 'floaterm_autoclose', 1)
let g:floaterm_autoinsert       = get(g:, 'floaterm_autoinsert', v:true)
let g:floaterm_autohide         = get(g:, 'floaterm_autohide', 1)
let g:floaterm_position         = get(g:, 'floaterm_position', 'center')
let g:floaterm_borderchars      = get(g:, 'floaterm_borderchars', '─│─│┌┐┘└')
let g:floaterm_rootmarkers      = get(g:, 'floaterm_rootmarkers', ['.project', '.git', '.hg', '.svn', '.root'])
let g:floaterm_opener           = get(g:, 'floaterm_opener', 'split')

command! -nargs=* -complete=customlist,floaterm#cmdline#complete -bang -range
                          \ FloatermNew    call floaterm#run('new', <bang>0, [visualmode(), <range>, <line1>, <line2>], <q-args>)
command! -nargs=* -complete=customlist,floaterm#cmdline#complete
                          \ FloatermUpdate call floaterm#run('update', 0, [], <q-args>)
command! -nargs=? -count=0 -bang -complete=customlist,floaterm#cmdline#complete_names1
                          \ FloatermShow   call floaterm#show(<bang>0, <count>, <q-args>)
command! -nargs=? -count=0 -bang -complete=customlist,floaterm#cmdline#complete_names1
                          \ FloatermHide   call floaterm#hide(<bang>0, <count>, <q-args>)
command! -nargs=? -count=0 -bang -complete=customlist,floaterm#cmdline#complete_names1
                          \ FloatermKill   call floaterm#kill(<bang>0, <count>, <q-args>)
command! -nargs=? -count=0 -bang -complete=customlist,floaterm#cmdline#complete_names1
                          \ FloatermToggle call floaterm#toggle(<bang>0, <count>, <q-args>)
command! -nargs=? -range   -bang -complete=customlist,floaterm#cmdline#complete_names2
                          \ FloatermSend   call floaterm#send(<bang>0, visualmode(), <range>, <line1>, <line2>, <q-args>)
command! -nargs=0           FloatermPrev   call floaterm#prev()
command! -nargs=0           FloatermNext   call floaterm#next()
command! -nargs=0           FloatermFirst  call floaterm#first()
command! -nargs=0           FloatermLast   call floaterm#last()

hi def link Floaterm       Normal
hi def link FloatermNC     NormalNC
hi def link FloatermBorder NormalFloat

let g:floaterm_keymap_new    = get(g:, 'floaterm_keymap_new', '<A-n>')
let g:floaterm_keymap_prev   = get(g:, 'floaterm_keymap_prev', '<leader>,')
let g:floaterm_keymap_next   = get(g:, 'floaterm_keymap_next', '<leader>.')
let g:floaterm_keymap_first  = get(g:, 'floaterm_keymap_first', '')
let g:floaterm_keymap_last   = get(g:, 'floaterm_keymap_last', '')
let g:floaterm_keymap_hide   = get(g:, 'floaterm_keymap_hide', '')
let g:floaterm_keymap_show   = get(g:, 'floaterm_keymap_show', '')
let g:floaterm_keymap_kill   = get(g:, 'floaterm_keymap_kill', '')
let g:floaterm_keymap_toggle = get(g:, 'floaterm_keymap_toggle', '<A-t>')

function! s:bind_keymap(mapvar, command) abort
  if !empty(a:mapvar)
    execute printf('nnoremap <silent> %s :%s<CR>', a:mapvar, a:command)
    execute printf('tnoremap <silent> %s <C-\><C-n>:%s<CR>', a:mapvar, a:command)
  endif
endfunction
call s:bind_keymap(g:floaterm_keymap_new,    'FloatermNew')
call s:bind_keymap(g:floaterm_keymap_prev,   'FloatermPrev')
call s:bind_keymap(g:floaterm_keymap_next,   'FloatermNext')
call s:bind_keymap(g:floaterm_keymap_first,  'FloatermFirst')
call s:bind_keymap(g:floaterm_keymap_last,   'FloatermLast')
call s:bind_keymap(g:floaterm_keymap_hide,   'FloatermHide')
call s:bind_keymap(g:floaterm_keymap_show,   'FloatermShow')
call s:bind_keymap(g:floaterm_keymap_kill,   'FloatermKill')
call s:bind_keymap(g:floaterm_keymap_toggle, 'FloatermToggle')

" My costum shortcuts
nnoremap <C-s> :wa<CR>

