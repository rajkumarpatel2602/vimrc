nmap <F7> :mksession! ~/vim_session<CR>
nmap <F8> :source ~/vim_session<CR>
nmap <F11> :bp<CR>
nmap <F5> :tab sp<CR> 
nmap <F12> :bn<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nmap <F10> /<C-r><C-w>
nmap <F6> :!cscope -d<CR>
nnoremap <ESC><ESC> :noh<CR>
:map <leader>b :ls<CR>:b

nnoremap <Leader>r :%s///g<left><left>
nnoremap <Leader>rc :%s///g<left><left><left>


set wildmenu           " see :h 'wildmenu'
set wildmode=list:full " see :h 'wildmode' for all the possible values

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' } "XXX to remove error

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-e> :Rg<CR>

"com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right'), <bang>0)

"https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
" PLUGIN: FZF
"let mapleader = "\"
"nnoremap <silent> <Leader>b :Buffers<CR>
"nnoremap <silent> <Leader>f :Rg<CR>
"nnoremap <silent> <Leader>/ :BLines<CR>
"nnoremap <silent> <Leader>' :Marks<CR>
"nnoremap <silent> <Leader>g :Commits<CR>
"nnoremap <silent> <Leader>H :Helptags<CR>
"nnoremap <silent> <Leader>hh :History<CR>
"nnoremap <silent> <Leader>h: :History:<CR>
"nnoremap <silent> <Leader>h/ :History/<CR> 
" Only content match is required not the full 
"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)
"set grepprg=ag\ --vimgrep\ --smart-case\ --follow

" This will remove all warnings
let g:go_version_warning = 0

set hlsearch
set nocompatible
set expandtab
set autoindent
set smartindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set showmatch
set ruler
set nohls
set number
set wrap
set linebreak
set mouse=a
syntax on
set history=1000
set incsearch
set laststatus=2
set nohlsearch
set hlsearch
:set colorcolumn=80
:color desert

autocmd BufWritePre *.conf :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e

if has("cscope")

    set cscopetag

    set csto=0

    if filereadable("cscope.out")
      set nocscopeverbose
        cs add cscope.out
      set cscopeverbose  
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    set cscopeverbose  

    cnoreabbrev <expr> ssr 
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find s'  : 'ssr')
    cnoreabbrev <expr> sfr
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find c' : 'sfc')
    cnoreabbrev <expr> sfd
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find g' : 'csr')
    cnoreabbrev <expr> of
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find f' : 'of')
    cnoreabbrev <expr> regx
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find t' : 'regx')

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>		

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@><C-@>s  :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif



-- steps
  405  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  406  sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
  407  sudo yum install ripgrep
  408  vim
  409  history

-- TROULESHOOT

 405  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  406  sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo 
  [ site:  https://github.com/BurntSushi/ripgrep]
  407  sudo yum -y install ripgrep
  [in FAILURE : yum-config-manager --disable copr.fedorainfracloud.org_coprs_carlwgeorge_ripgrep_repo_epel-7_carlwgeorge-ripgrep-epel-7.rep]
  408  vim
  409  history
  410 :PlugInstall
