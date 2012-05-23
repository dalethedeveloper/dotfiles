
call pathogen#infect()
" Double F5 to save
nnoremap <F5><F5> :w!<CR>
vnoremap <F5><F5> :w!<CR>

" https://github.com/vim-scripts/TinyBufferExplorer/
nnoremap <F3> :TBEMinimal<CR>
nnoremap - $
nnoremap ; :

" http://vim.wikia.com/wiki/Maximize_or_set_initial_window_size
if has("gui_running")
	set lines=55 columns=160
endif

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set smartindent
"set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set nohlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" http://mislav.uniqpath.com/2011/12/vim-revisited/
let mapleader=","

" http://www.8t8.us/vim/vim.html
set tags=tags;/

" Auto gen ctags with F12
" Thanks to http://blog.copyninja.info/2010/02/cc-auto-complete-for-vim.html 
" and http://mwop.net/blog/134-exuberant-ctags-with-PHP-in-Vim 
" noremap <F12> :!ctags -R --PHP-kinds=+cf --fields=+iaS --extra=+q -h '.php' -R --exclude='\.svn' --exclude='\.git' --exclude='*\.js' --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' /srv/http/wordpress/ <CR> 

" http://pissedoffadmins.com/vim_08242011.txt
let Tlist_Use_Right_Window=1
nmap <F9> :TlistToggle<CR>
set wildmenu
set wildmode=longest,list:full

" http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
set mouse=a
set ignorecase " case insensitive by default
set cursorline " highlight current line
set incsearch " BUT do highlight as you type your search phrase
"set report=0 " tell us when anything is changed via :...
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 " Keep 5 lines at the size
set lazyredraw
set ruler

" http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
set backupdir=~/.vimbackup,/tmp
set directory=~/.vimbackup,/tmp

" http://credentiality2.blogspot.com/2010/05/avoiding-annoying-no-write-since-last.html
set hidden

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" nnoremap <tab> %
" vnoremap <tab> %
nnoremap <leader>W :%s/\s\+$//<CR>:%s///g:let @/=''<CR>

" http://genotrance.wordpress.com/2008/02/04/my-vim-customization/
" let treeExplVertical=1
" let treeExplDirSort=1
" let treeExplNoList=1
" nnoremap <F2> :VSTreeExplore<cr>

" http://stackoverflow.com/questions/5817730/changing-root-in-nerdtree
set autochdir
let NERDTreeQuitOnOpen=1
let NERDTreeChDirMode=2
nnoremap <leader><F2> :NERDTree . <CR>
nnoremap <F2> :NERDTreeToggle<cr>

"http://ariya.blogspot.com/2008/07/vim-lightning-fast-navigation-in-large.html
"https://github.com/shemerey/vim-project
let g:proj_flags="imstvcgF"

" http://roshanbook.wordpress.com/2011/12/13/code-completion-in-vim/
function SuperCleverTab()
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  else
    if &omnifunc != ''
      return "\<C-X>\<C-O>"
    elseif &dictionary != ''
      return "\<C-K>"
    else
      return "\<C-N>"
    endif
  endif
endfunction
" I don't really like this implementation
"inoremap <Tab> <C-R>=SuperCleverTab()<CR>

" Inspired by http://amix.dk/vim/vimrc.html
" 	http://stackoverflow.com/questions/6496778/vim-run-autocmd-on-all-filetypes-except
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
" Dale special
nmap <C-k> <C-b>
nmap <C-j> <C-f> 

function DeleteTrailingWS()
  if &ft =~ 'javascript\|php\|python\|perl\|ruby\|html\|css'
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
  endif
endfunction
autocmd BufWrite * call DeleteTrailingWS()

" Annoying: http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
set pastetoggle=<F8>

" On the solarized bandwagon
if has('gui_running')
    set background=light
	colorscheme solarized
else
	colorscheme bensday
endif

