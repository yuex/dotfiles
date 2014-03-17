" vundle
    " :BundleLis           - Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Bundle command are not allowed..t
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    filetype plugin indent on
    Bundle 'gmarik/vundle'

    " general
        Bundle 'kien/ctrlp.vim'
        Bundle 'scrooloose/nerdtree'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'project.tar.gz'
        Bundle 'sessionman.vim'

        "Bundle 'Townk/vim-autoclose'
        Bundle 'Raimondi/delimitMate'
        Bundle 'tpope/vim-surround'
        Bundle 'kana/vim-textobj-user'
        Bundle 'mbbill/undotree'
        "Bundle 'YankRing.vim'
        Bundle 'godlygeek/tabular'

        Bundle 'Lokaltog/vim-easymotion'
        "Bundle 'yuex/vim-easymotion'
        Bundle 'matchit.zip'

        Bundle 'Lokaltog/vim-powerline'
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'mileszs/ack.vim'

    " programming
        " git integration
        Bundle 'tpope/vim-fugitive'
        " automatic syntax checker
        Bundle 'scrooloose/syntastic'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'majutsushi/tagbar'
        Bundle 'Yggdroot/indentLine'
        "Bundle 'willthefrog/indentLine'
        " use astyle for C#/C++/C/Java, jsbeautify for Javascript
        " autopep8 for python, tidy for HTML/XHTML/XML
        "Bundle 'Chiel92/vim-autoformat'
        "Bundle 'einars/js-beautify'

    " snippet and autocomplete
        "Bundle 'Shougo/neocomplcache'
        "Bundle 'Shougo/neosnippet'
        " snipMate cant be configured to disable completion after space(\s), first of line(^), also in confilict with supertab
        "Bundle 'snipMate'
        "Bundle 'honza/snipmate-snippets'
        " code semantic and fuzzy completion
        Bundle 'Valloric/YouCompleteMe'
        " tab complete all, (C-xC-o, C-xC-k, etc), including English word
        "Bundle 'ervandew/supertab'
        "Bundle 'Rip-Rip/clang_complete'
        "let g:SuperTabDefaultCompletionType='context'

    " HTML
        Bundle 'HTML-AutoCloseTag'

    " notetaking
        "Bundle 'vimwiki/vimwiki'
        Bundle 'yuex/vimwiki'
        Bundle 'aaronbieber/quicktask'
        Bundle 'VOoM'
        Bundle 'plasticboy/vim-markdown'
        Bundle 'VimOrganizer'
        Bundle 'utl.vim'
        " depends on gem github-markup tilt redcarpet but it doesn't work :(.
        " Maybe after I learned myself a byte of ruby to fix it
        "Bundle 'matthias-guenther/hammer.vim'
        " real-time preview
        "Bundle 'suan/vim-instant-markdown'
        "Bundle 'jtratner/vim-flavored-markdown'
        "Bundle 'samsonw/vim-task'
        " provide calendar support in vimwiki
        "Bundle 'mattn/calendar-vim'

    let bundle_name = map(copy(g:bundles), 'v:val.name')
    "let g:bundle_name = bundle_name

" general setting
    " spell checking and dictionary completion
        set spell spelllang=en
        set dictionary=/usr/local/plan9/lib/words
        set iskeyword-=_
        "set complete-=k complete+=k

    " encoding
        set encoding=utf-8
        set fileencodings=ucs-bom,utf-8,default,chinese

    " ruler = bottom hint message
        set ruler
        set number
        set showcmd
        set showmode
        set cursorline  " hightlight current line

    " search options
        set hlsearch    " disable with :nohl
        set ignorecase  " dont differ between case
        set smartcase   " override ignorecase when uppercase occurs
        set incsearch   " incremental search
        set wrapscan    " wrapscan = wrap to top when reach end

    " screen scroll options
        set scrolljump=5        " lines to scroll when cursor leaves screen
        set scrolloff=3        " minimum lines to keep around the cursor

    " format options
        "set nowrap
        set autoindent
        set virtualedit=onemore
        "set smartindent
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4
        set expandtab
        set foldmethod=indent
        set foldopen+=insert
        set autowrite
        set list
        set listchars=tab:,.,trail:.,extends:#,nbsp:.

    " modeline example
        " // vim: set ts=8 sts=4 sd=4 noexpandtab:
        " put it in any file, comment it out, modeline will overwrite settings in vim rc

    " color shceme options
        set bg=dark
        "set t_Co=256
        syntax on
        " solarized needs termianl palette configured properly
        " checkout
        colorscheme solarized
        "let g:solarized_termcolors=256
        "let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_visibility="high"

    " fast <esc> from interleave event, delay caused by enable meta key
    " C-c get no delay
        "if ! has('gui_running')
            "set ttimeoutlen=10
            "augroup FastEscape
                "autocmd!
                "au InsertEnter * set timeoutlen=0
                "au InsertLeave * set timeoutlen=1000
            "augroup END
        "endif

" keymapping
" remap \ to ,
    let mapleader = ';'
    let maplocalleader = ','
    noremap <Esc>; :
    inoremap <Esc>; <C-o>:
    noremap \ ;
    noremap <C-\> ,

" vim hacks fix meta-keys which generate <Esc>a .. <Esc>z
    let c = 'a'
    while c <= 'z'
        exec "set <M-".c.">=\e".c
        exec "inoremap \e".c." <M-".c.">"
        let c = nr2char(1+char2nr(c))
    endw
    let c = '0'
    while c <= '9'
        exec "set <M-".c.">=\e".c
        exec "inoremap \e".c." <M-".c.">"
        let c = nr2char(1+char2nr(c))
    endw

" fold level
    for lvl in range(0,9)
        exec "nnoremap <Leader>z".lvl." :set foldlevel=".lvl."<CR>"
    endfor

" wrapper of command-mode commands
    " q: ex-command
    "nnoremap q: q:i
    "nnoremap q/ q/i
    "nnoremap q? q?i

    " change working directory
    cnoremap cwd lcd %:p:h
    cnoremap cd. lcd %:p:h

    " when u forget to sudo.. really write the file
    cnoremap w!! w !sudo tee % >/dev/null

" extra keybinding
    " quick :make
    nnoremap <silent> <F5> :make<CR>:redraw

    " hack for python2 on archlinux
    nnoremap <silent> <F6> :set makeprg=python2\ %<CR>:make<CR>

    " quickquit
    "nnoremap <C-c> :confirm q<CR>
    "nnoremap <C-c> :q<CR>
    function SmartQuit()
        if !&modified
            exec "quit"
        else
            redraw
            echohl WarningMsg
            echo "Buffer changed! [^W]w [^S]x [^B^N]q!: "
            echohl None

            let cmd = "redraw!"
            let ret = nr2char(getchar())

            if match('', ret) >= 0
                " BOOM! NUKE!
                let cmd = "q!"
            elseif ret == ''
                let cmd = "w"
            elseif ret == ''
                let cmd = "x"
            endif

            try
                exec cmd
            catch
                redraw
                echohl ErrorMsg
                echo matchstr(v:exception, '\(Vim(.*):\)\@<=.*')
                echohl None
            endtry
        endif
    endfunc
    nnoremap <C-c> :call SmartQuit()<CR>

" quicktabpage
    " move to previous or next tab, <Esc> for <M-
    " XXX: use dict to implement this kind mapping. map-nvo and map-i
    " XXX: tips for easy memorizing. <Left> and <Right> are intuitive. for Up and
    " Down, note that some laptop keyboard designs squeeze <Home> and <End>
    " to <Up> and <Down>, <Home> for create, <End> for close
    " XXX: <Esc><C-PageUp/PageDown> and <Esc><Home>/<End> doesn't work :(
    nnoremap <silent> <Esc><Left>  :tabprevious<CR>
    nnoremap <silent> <Esc><Right> :tabnext<CR>
    nnoremap <silent> <Esc><Down>    :tabnew<CR>
    nnoremap <silent> <Esc><Up>  :tabclose<CR>
    inoremap <Esc><Left>  <C-o>:tabprevious<CR>
    inoremap <Esc><Right> <C-o>:tabnext<CR>
    inoremap <Esc><Up>    <C-o>:tabnew<CR>
    inoremap <Esc><Down>  <C-o>:tabclose<CR>
    " move tab left or right
    nnoremap <Esc><PageUp>   :tabmove -1<CR>
    nnoremap <Esc><PageDown> :tabmove +1<CR>
    inoremap <Esc><PageUp>   <C-o>:tabmove -1<CR>
    inoremap <Esc><PageDown> <C-o>:tabmove +1<CR>
    " move to tab #1-#9, #0 is last"
    nnoremap <M-0> :tablast<CR>
    inoremap <M-0> <C-o>:tablast<CR>
    let c = '1'
    while c <= '9'
        exec "nnoremap <M-".c."> :tabnext ".c."<CR>"
        exec "inoremap <M-".c."> <C-o>:tabnext ".c."<CR>"
        let c = nr2char(1+char2nr(c))
    endw

" toggle
    inoremap <M-m> <C-o>:setlocal number!<CR>
    nnoremap <M-m> :setlocal number!<CR>
    "nnoremap <M-r> :vertical resize 80<CR>
    inoremap <M-s> <C-o>:set invhlsearch<CR>
    nnoremap <M-s> :set invhlsearch<CR>
    nnoremap <M-e> :NERDTree %:p:h<CR>
    autocmd FileType nerdtree nnoremap <buffer><M-e> :NERDTreeClose<CR>
    nnoremap <M-u> :UndotreeToggle<CR>
    nnoremap <M-g> <Plug>ToggleProject
    " yankring
    nnoremap <M-y> :YRShow<CR>

" unix-like n- and v-motion
    " go as u see
    noremap j gj
    noremap k gk
    map gt T
    map gf F

" autocommand
    " script auto-executable configs
    " % is the filename of the file
    autocmd BufNewFile *.py call append(0,"#!/usr/bin/env python")
    autocmd FileType python set makeprg=python\ %

    autocmd BufNewFile *.rb call append(0,"#!/usr/bin/env ruby")
    autocmd FileType ruby set makeprg=ruby\ %

    autocmd BufNewFile *.tcl call append(0,"#!/usr/bin/env tclsh")
    autocmd FileType tcl set makeprg=tclsh\ %

    autocmd BufNewFile *.sh call append(0,"#!/usr/bin/env sh")
    autocmd FileType sh set makeprg=bash\ %

    autocmd BufNewFile *.lisp call append(0,"#!/usr/bin/env clisp")
    autocmd FileType lisp set makeprg=clisp\ %

    autocmd BufWritePost *.sh,*.py,*.rb,*.tcl,*.lisp exec "!chmod a+x %"
                \| exec "redraw"

    autocmd BufEnter *.org setlocal filetype=org

    " adjust makeprg according to filetype
    autocmd FileType tex set makeprg=pdflatex\ %
    autocmd FileType c set makeprg=gcc\ -Wall\ -o%<.o\ %;./%<.o
    autocmd FileType html,css,c,cpp,yaml set tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType make set noexpandtab

    autocmd BufRead,BufNewFile *.conf setfiletype conf

    "autocmd BufEnter * set tabstop=4 shiftwidth=4 softtabstop=4
    "autocmd BufEnter *.c,*.h,*.cpp,*.cc set tabstop=2 shiftwidth=2 softtabstop=2
    "autocmd BufEnter *.html,*.css set tabstop=2 shiftwidth=2 softtabstop=2

"quickmode
    "quickmotion
        "inoremap and cnoremap
        noremap! <C-a> <Home>
        noremap! <C-e> <End>
        noremap! <C-h> <Left>
        noremap! <C-l> <Right>
        noremap! <Esc><C-h> <C-Left>
        noremap! <Esc><C-l> <C-Right>
        noremap! <M-b> <S-Left>
        noremap! <M-f> <S-Right>
        noremap! <M-h> <BS>
        noremap! <M-l> <Del>

    " quickinsert inoremap
        " it seems <C-Left> and <C-Right> in insert mode
        inoremap <Esc><C-h> <C-o>B
        inoremap <Esc><C-l> <C-o>E<Right>
        inoremap <M-f> <C-o>e<Right>

        inoremap <C-a> <C-o>^
        inoremap <C-j> <C-o>g<Down>
        inoremap <C-k> <C-o>g<Up>
        inoremap <M-e> <C-o>e<Right>
        inoremap <Esc><C-j> <C-o>}
        inoremap <Esc><C-k> <C-o>{

        inoremap <C-u> <C-o>d^
        inoremap <M-u> <C-o>d$
        inoremap <Esc><C-u> <C-o>d0
        inoremap <Esc><C-k> <C-o>d$
        inoremap <C-w> <C-o>db
        inoremap <M-d> <C-o>de
        inoremap <M-w> <C-o>de
        inoremap <C-y> <C-r>-
        inoremap <C-s> <C-o>d
        inoremap <C-s>u <C-o>u

        inoremap <Esc>, <C-o><<
        inoremap <Esc>. <C-o>>>
        inoremap <M-a> <C-o><C-a>
        inoremap <M-x> <C-o><C-x>

        inoremap <M-v> <C-o>v

    " quickcmd
        "cnoremap <C-o> <C-f>, set cedit=
        set cedit=<C-o>
        set cmdwinheight=3
        noremap : :<C-o><C-c>
        cnoremap <M-n> <Down>
        cnoremap <M-p> <Up>
        cnoremap <M-j> <Down>
        cnoremap <M-k> <Up>

        cnoremap <C-a> <C-o>^<C-c>
        cnoremap <C-j> <C-n>
        cnoremap <C-k> <C-p>
        cnoremap <M-e> <C-o>el<C-c>
        cnoremap <Esc><C-j> <C-n>
        cnoremap <Esc><C-k> <C-p>

        cnoremap <C-u> <C-o>d^<C-c>
        cnoremap <M-u> <C-o>d$<C-c>
        cnoremap <Esc><C-u> <C-o>d0<C-c>
        cnoremap <Esc><C-u> <C-o>d$<C-c>
        cnoremap <C-w> <C-o>db<C-c>
        cnoremap <M-d> <C-o>de<C-c>
        cnoremap <M-w> <C-o>de<C-c>
        cnoremap <C-y> <C-r>-
        cnoremap <C-s> <C-o>d

        cnoremap <Esc>, <C-o><<<C-c>
        cnoremap <Esc>. <C-o>>><C-c>
        cnoremap <M-a> <C-o><C-a><C-c>
        cnoremap <M-x> <C-o><C-x><C-c>
        "cnoremap <C-w> <C-c><C-w>

    " quicknormal
        "noremap
            noremap <Esc><C-w> w

        noremap <C-a> ^
        noremap <C-e> <End>
        noremap <C-h> <Left>
        noremap <C-l> <Right>
        noremap <C-j> g<Down>
        noremap <C-k> g<Up>
        noremap <Esc><C-h> <C-Left>
        noremap <Esc><C-l> E<Right>
        noremap <Esc><C-b> <S-Left>
        noremap <Esc><C-f> <S-Right>

        noremap <Esc><C-e> e
        noremap <Esc><C-j> }
        noremap <Esc><C-k> {

        nnoremap <Esc>, <<
        nnoremap <Esc>. >>
        nnoremap Y y$

        nnoremap <M-a> <C-a>
        nnoremap <M-x> <C-x>

        noremap <M-h> X
        noremap <M-l> x

        " quickvisual "
        vnoremap <Esc>, <gv
        vnoremap <Esc>. >gv
        vnoremap < <gv
        vnoremap > >gv

    " quicksearch, easysearch
        " search result to list
        function Searchlist(pattern, flag)
            let @/ = a:pattern
            exec 'lvimgrep /'.a:pattern.'/'.a:flag.' %'
            call ToggleQuickfix('l')
        endfun

        onoremap in( :<c-u>normal! f(vi(
        vnoremap in( :<c-u>normal! f(vi(

        " search and visual select (..) and )..(
        " checkout vim-textobj-user
        for c in add(split('(:),[:],{:},<:>,*:*,-:-,":"',','),"':'")
            let [s,e] = split(c,':')
            let switched = 0
            while 1
                let s_re = escape(s, '[\^$.*')
                let e_re = escape(e, ']\^$.*')
                let i_re = s_re.'\zs[^'.escape(e.s,'^]\').']*\ze'.e_re
                let a_re = '\zs'.s_re.'[^'.escape(e.s,'^]\').']*'.e_re.'\ze'
                let mycount = v:count > 1 ? v:count : ''

                " use \i* and \a* to search for next **
                " use |i* and |a* to search for prev **
                " preceding count is supported
                exec "noremap \\i".s." ".mycount."/".i_re."<CR>"
                exec 'noremap \|i'.s." ".mycount."?".i_re."<CR>"
                exec "noremap \\a".s." ".mycount."/".a_re."<CR>"
                exec 'noremap \|a'.s." ".mycount."?".a_re."<CR>"

                " self-defined text object
                " va* and vi* to select between **
                " I know it's some dirty hacks, but easy to be converted into a
                " plugin or so. Maybe some time later when I get the mood
                " it's actually some scripted version of following mappings
                " vnoremap a* :<C-u>set nows<CR>v?\*<CR>o/\*<CR>:<C-u>set ws<CR>gv
                " vnoremap i* :<C-u>set nows<CR>v?\*\zs?e+1<CR>o/\ze\*/e-1<CR>:<C-u>set ws<CR>gv
                exec 'vnoremap a'.s.' '.
                            \':<C-u>set nows<CR>
                            \v?'.s_re.'<CR>
                            \o/'.e_re.'<CR>
                            \:<C-u>set ws<CR>
                            \gv'
                exec 'vnoremap i'.s.' '.
                            \':<C-u>set nows<CR>
                            \v?'.s_re.'<CR>l
                            \o/'.e_re.'<CR>h
                            \:<C-u>set ws<CR>
                            \gv'

                " a simple check to support (:) and ):( automatically
                " so you don't need to manually put ):( in the for loop
                if s ==# e || switched
                    break
                else
                    let [s,e] = [e,s]
                    let switched = 1
                endif
            endw
        endfor
        for off in split('e:s:b','\zs')
            exec "vnoremap v".off." //".off."<CR>"
        endfor

        " enable * and # in visual mode
        " Search for visual selected text, forwards or backwards.
        " visual select text, use * for forwards and # for backwards searching
        " n and N to go next and prev
        " stole from http://vim.wikia.com/wiki/Search_for_visually_selected_text
        vnoremap <silent> * :<C-U>
          \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
          \gvy/<C-R><C-R>=substitute(
          \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
          \gV:call setreg('"', old_reg, old_regtype)<CR>
        vnoremap <silent> # :<C-U>
          \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
          \gvy?<C-R><C-R>=substitute(
          \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
          \gV:call setreg('"', old_reg, old_regtype)<CR>

    " quickpaste, quickcopy
        "set pastetoggle=<Esc><C-p>
        set pastetoggle=<M-p>
        vnoremap <Esc><C-y> "+y
        nnoremap <Esc><C-y> "+yy
        " paste before the curor
        nnoremap <Esc><C-v> "+P
        " paste after the curor, rare case
        "nnoremap <Esc><C-p> "+p
        inoremap <Esc><C-v> <C-o>"+P

    " quickwindow
        "nnoremap <C-w><C-m> :vnew<CR>
        "nnoremap <C-w>m     :vnew<CR>
        noremap <C-w><C-n>\|     :vnew<CR>
        noremap <C-w><C-n>_     :new<CR>
        noremap <C-w>_ <C-w><C-s>
        noremap <C-w>\| <C-w><C-v>
        noremap <C-w>== <C-w>=
        noremap <C-w>=_ <C-w>_
        noremap <C-w>=\| <C-w>\|

        "noremap! <M-w> <C-c><C-w>w
        "noremap! <M-r> <C-c><C-w>W
        "noremap! <M-o> <C-c><C-w><C-p>
        noremap <M-w> <C-w>w
        noremap <M-r> <C-w>W
        noremap <M-o> <C-w><C-p>
        noremap <C-w><C-o> <C-w><C-p>
        noremap <C-w><M-o> <C-w><C-o>

        noremap <C-w>+ 5<C-w>+
        noremap <C-w>- 5<C-w>-
        noremap <C-w>< 5<C-w>>
        noremap <C-w>> 5<C-w><

        noremap <C-w>o <C-w>w
        noremap <C-w>O <C-w>W
        noremap <C-w><C-t> <C-w>T

    " mottos"
        let g:mottos_prompt = "省» "
        noremap <silent> <C-s>
                    \ :<C-u>echoh Question
                    \\| echo g:mottos_prompt.substitute(system('mottos',&winwidth-strlen(g:mottos_prompt)),'','','')
                    \\| echoh None<CR>

            "inoremap <Esc><C-k> <C-o>d<End>

            "inoremap <C-d> <C-o>w

            "noremap <Esc><C-e> e
            "noremap <Esc><C-g><Esc><C-e> ge
            "inoremap <C-g><C-h> <C-o>F
            "inoremap <C-g><C-l> <C-o>f

            "inoremap <Esc><C-t> <C-d>

            " insert mode quick deletion

            "inoremap <C-s><C-y> <C-o>P
            "inoremap <C-s><C-j> <C-o>J

    " quickfix
        " todo, fixme, and xxx vimgrep
        function ToggleQuickfix(type)
            let flagname = 'b:quickfix_'.a:type.'_opened'
            let cmdopen = a:type.'window'
            let cmdclose = a:type.'close'
            if !exists(flagname)
                exec "let ".flagname." = 0 "
            endif
            exec "let flag = ".flagname
            if flag == 0
                exec cmdopen
                exec "let ".flagname." = 1 "
            elseif flag == 1
                exec cmdclose
                exec "let ".flagname." = 0 "
            endif
        endfun
        nnoremap <Leader>td :vimgrep /TODO\\|FIXME\\|XXX/ %<CR>:call ToggleQuickfix('c')<CR>
        nnoremap <Leader>ld :lvimgrep /TODO\\|FIXME\\|XXX/ %<CR>:call ToggleQuickfix('l')<CR>
        nnoremap <Leader>tt :call ToggleQuickfix('c')<CR>
        nnoremap <Leader>tn :cnext<CR>
        nnoremap <Leader>tp :cprev<CR>
        nnoremap <Leader>ll :call ToggleQuickfix('l')<CR>
        nnoremap <Leader>ln :lnext<CR>
        nnoremap <Leader>lp :lprev<CR>

    " quick deletion using <C-s>
        "inoremap <C-s><C-a> <C-o>d<Home>
        "inoremap <C-s><C-e> <C-o>d<End>
        "inoremap <C-s><C-w> <C-o>dB
        "inoremap <C-s><C-d> <C-o>dW
        "inoremap <C-s><M-w> <C-o>dB
        "inoremap <C-s><M-d> <C-o>dW
        "inoremap <C-s><Esc>e <C-o>de
        "inoremap <C-s><Esc><C-e> <C-o>dge
        "inoremap <C-s><C-f> <C-o>dw
        "inoremap <C-s><C-b> <C-o>db
        "inoremap <C-s><C-u> <C-o>d^
        "inoremap <C-s><C-k> <C-o>d$
        "inoremap <C-s><C-d> <C-o>d
        "inoremap <C-s>u <C-o>u
        "inoremap <C-s><C-y> <C-o>P
        "inoremap <C-s><C-j> <C-o>J
        "inoremap <C-q> <BS>
        "inoremap <M-q> <Del>
        "inoremap <Esc><C-q> <Del>

    " strip space at the end of line
    nnoremap <Leader>fs :retab<CR>:%s/\s\+$//g<CR>``
    nnoremap <Leader>fc gg=G

    " zz, zt, zb, place current line on screen
        for key in ['z','t','b']
            exec "inoremap <C-z><C-".key."> <C-o>z".key
            exec "inoremap <C-z>".key." <C-o>z".key
        endfor
        for key in ['H','L','M']
            exec "inoremap <C-z>".key." <C-o>".key
        endfor
        nnoremap zh zt
        nnoremap zl zb
        vnoremap zh zt
        vnoremap zl zb
        inoremap <C-z>h <C-o>zt
        inoremap <C-z>l <C-o>zb
        inoremap <C-z><C-h> <C-o>zt
        inoremap <C-z><C-l> <C-o>zb

    "" zR, zC, zO, fold
        "for key in ['R','M','O','r','m','o']
            "exec "inoremap <C-z>".key." <C-o>z".key
        "endfor

    " insert mode <C-r>=Funcexec(cmd)
    " used to execute normal commands in insert mode without leaving
    function Funcexec(cmd)
        exec a:cmd
    endfun

" easymotion and insert mode motion
if match(bundle_name, 'vim-easymotion') >= 0
    " to have more choice for insert mode eaasymotion
    " for exmaple, <M-o>ge, <M-o>gE
    let g:EasyMotion_leader_key = '<M-v>'
    let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
    let g:EasyMotion_do_shade = 0
    " use easymotion replace vim's default motion
    for key in ['W','B','E',"gE"]
        exec "map ".key." <Plug>(easymotion-".key.")"
    endfor
    for key in ['t','f','T','F']
        exec "map ".key." <Plug>(easymotion-".key.")"
    endfor
    imap <C-f> <C-o>f
    imap <C-b> <C-o>T
    for key in ['w','b','e',"ge"]
        exec "map ".key." <Plug>(easymotion-iskeyword-".key.")"
        if strlen(key) != 1 || key < 'a' || key > 'z'
            continue
        endif
        exec "imap <Esc><C-".key."> <C-o><Plug>(easymotion-iskeyword-".key.")"
    endfor
    for key in ['j','k']
        exec "map <M-".key."> <Plug>(easymotion-".key.")"
        exec "imap <M-".key."> <C-o><Plug>(easymotion-".key.")"
    endfor
    "for key in ['t','T','f','F','w','b','e','W','B','E',"ge","gE"]
        "let act = key

        "if key ==# 'w' || key ==# 'b' || key ==# 'e' || key ==# 'ge'
            "let act = "iskeyword-".key
        "endif

        "exec "map ".key." <Plug>(easymotion-".act.")"

        "if strlen(key) != 1 || key < 'a' || key > 'z'
            "continue
        "else
            "exec "imap <Esc><C-".key."> <C-o><Plug>(easymotion-".act.")"
        "endif
    "endfor
    "noremap <C-f> t
    "noremap <C-b> T
endif

" vim-textobj-user
if match(bundle_name, 'vim-textobj-user') >= 0
    "call textobj#user#plugin('asterisk', {
                "\   'text': {
                "\       'pattern': ['\*','\*'],
                "\       'select-a': 'a*',
                "\       'select-i': 'i*',
                "\   }
endif

" indentLine
if match(bundle_name, 'indentLine') >= 0
    nnoremap <Leader>il :IndentLinesToggle<CR>
    "let g:indentLine_enabled = 1
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_char = '│'
    let g:indentLine_first_char = '│'
    let g:indentLine_noConcealCursor = 1
    let g:indentLine_faster = 1
    let g:indentLine_fileTypeExclude = []
    let g:indentLine_fileType = ['c','cpp','python']
endif

" quicktask
if match(bundle_name, 'quicktask') >= 0
    let g:quicktask_snip_path= '~/snips'
    let g:quicktask_snip_default_filetype = 'markdown'
    nnoremap <Leader>ti Go# vim:ft=quicktask<Esc><C-o>
endif

" hammer, poor man's hammer
    "autocmd FileType vimwiki,markdown nnoremap <Leader>hh
    autocmd FileType * nnoremap <Leader>hh
                \ :silent !hammer "%" > "/tmp/%:t.html"<CR>
                \ :silent !xdg-open "/tmp/%:t.html"<CR>
                \ :redraw!<CR>
    "nnoremap <Leader>hh :Hammer<CR>

" vimwiki
if match(bundle_name, 'vimwiki') >= 0
    " use :hammer to have a quick preview of markdown
    " use pandoc to convert markdown to html in batch es
    " use grip to have a instant view of github flavoured markdown
    " use python-markdown extension to support table
    "let g:vimwiki_table_mappings = 1
    "let g:vimwiki_list_mappings = 0
    "let g:vimwiki_header_mode = 1
    let g:vimwiki_autowriteall = 1
    let g:vimwiki_folding = 'expr'
    autocmd FileType vimwiki set foldlevel=1
    " followning <CR> nmap breaks jumping in error window
    "autocmd FileType vimwiki nmap <CR> <Plug>VimwikiFollowLink
    "autocmd FileType vimwiki nmap <BS> <Plug>VimwikiGoBackLink
    autocmd FileType vimwiki nmap <C-n> <Plug>VimwikiNextLink
    autocmd FileType vimwiki nmap <C-p> <Plug>VimwikiPrevLink
    nnoremap <Leader>vi :VimwikiGenerateLinks<CR>
    nnoremap <Leader>vg :VimwikiGoto<Space>
    nnoremap <Leader>vs :VimwikiSearch<Space>
    nnoremap <Leader>vb :VimwikiBacklinks<CR>
    nnoremap <Leader>vh :VimwikiAll2HTML<CR>
    nnoremap <Leader>vt :VimwikiTable<Space>
                "\| iunmap <buffer> <CR>

    "autocmd BufEnter * nmap <buffer> <BS> <Plug>VimwikiGoBackLink
    let g:vimwiki_dir_link = 'index'
    let g:vimwiki_ext2syntax = {'.md': 'markdown',}
    let g:vimwiki_list = [
        \ {'path': '~/vimwiki/markdown-main/', 'syntax': 'markdown', 'ext': '.md', 'path_html': '~/vimwiki/html/markdown-test/'},
        \ {'path': '~/vimwiki/main/', 'syntax': 'default', 'ext': '.wiki', 'path_html': '~/vimwiki/html/main/'},
        \ {'path': '~/vimwiki/research/', 'syntax': 'default', 'ext': '.wiki', 'path_html': '~/vimwiki/html/research/'},
        \ ]
    " dev workaround
    autocmd FileType vimwiki iunmap <buffer> <C-L><C-J>
    autocmd FileType vimwiki iunmap <buffer> <C-L><C-K>
    autocmd FileType vimwiki iunmap <buffer> <C-L><C-M>
    autocmd FileType vimwiki iunmap <buffer> <buffer> <C-D>
    autocmd FileType vimwiki iunmap <buffer> <buffer> <C-T>
    autocmd FileType vimwiki inoremap <buffer> <C-G><C-D> <C-O>:VimwikiListDecreaseLvl 0<CR>
    autocmd FileType vimwiki inoremap <buffer> <C-G><C-T> <C-O>:VimwikiListIncreaseLvl 0<CR>
    autocmd FileType vimwiki inoremap <buffer> <C-G><C-J> <C-O>:VimwikiListChangeMarker next i<CR>
    autocmd FileType vimwiki inoremap <buffer> <C-G><C-K> <C-O>:VimwikiListChangeMarker prev i<CR>
    autocmd FileType vimwiki inoremap <buffer> <C-G><C-M> <Esc>:call vimwiki#lst#toggle_list_item()<CR>
endif

" VOoM
if match(bundle_name, 'VOoM') >= 0
    autocmd FileType voomtree nnoremap <buffer> j j:<C-u>call Voom_TreeSelect(1)<CR>
    autocmd FileType voomtree nnoremap <buffer> k k:<C-u>call Voom_TreeSelect(1)<CR>
    autocmd FileType voomtree nnoremap <buffer> h :<C-u>call Voom_TreeLeft()<CR>
    autocmd FileType voomtree nnoremap <buffer> l :<C-u>call Voom_TreeRight()<CR>
    autocmd FileType voomtree nnoremap <buffer> <Down> <Down>
    autocmd FileType voomtree nnoremap <buffer> <Up> <Up>
    autocmd FileType voomtree nnoremap <buffer> <Left> <Left>
    autocmd FileType voomtree nnoremap <buffer> <Right> <Right>
    autocmd FileType voomtree nnoremap <buffer><silent> <C-K> :<C-u>call Voom_Oop('up', 'n')<CR>
    autocmd FileType voomtree vnoremap <buffer><silent> <C-K> :<C-u>call Voom_Oop('up', 'v')<CR>

    autocmd FileType voomtree nnoremap <buffer><silent> <C-J> :<C-u>call Voom_Oop('down', 'n')<CR>
    autocmd FileType voomtree vnoremap <buffer><silent> <C-J> :<C-u>call Voom_Oop('down', 'v')<CR>

    autocmd FileType voomtree nnoremap <buffer><silent> <C-H> :<C-u>call Voom_Oop('left', 'n')<CR>
    autocmd FileType voomtree vnoremap <buffer><silent> <C-H> :<C-u>call Voom_Oop('left', 'v')<CR>

    autocmd FileType voomtree nnoremap <buffer><silent> <C-L> :<C-u>call Voom_Oop('right', 'n')<CR>
    autocmd FileType voomtree vnoremap <buffer><silent> <C-L> :<C-u>call Voom_Oop('right', 'v')<CR>
    autocmd BufEnter * nnoremap <buffer><silent> <M-q>
                \ :if exists("b:voomopen") && b:voomopen
                    \\| let b:voomopen=0
                    \\| exec "Voomquit"
                \\| else
                    \\|let b:voomopen=1
                    \\| exec "Voom"
                \\| endif<CR>
    autocmd FileType voomtree nnoremap <buffer><silent> <M-q>
                \ :call Voom_ToTreeOrBodyWin()<CR>
                \ :if exists("b:voomopen") && b:voomopen
                    \\| let b:voomopen=0
                \\| endif<CR>
                \ :call Voom_ToTreeOrBodyWin()<CR>
                \ :quit<CR>
    autocmd BufWinLeave,QuitPre *
                \ if &ft != 'voomtree'
                    \| if exists('b:voomopen') && b:voomopen
                        \| let b:voomopen=0
                        \| call Voom_ToTreeOrBodyWin()
                        \| exec "quit"
                    \| endif
                \| else
                    \| call Voom_ToTreeOrBodyWin()
                    \| if exists("b:voomopen")
                        \| let b:voomopen=0
                    \| endif
                    \| call Voom_ToTreeOrBodyWin()
                \| endif
    "autocmd BufWinEnter *
                "\ if &ft != 'voomtree'
                    "\| if exists('b:voomopen') && b:voomopen
                        "\| exec "Voom"
                    "\| endif
                "\|endif

    "nmap <M-q> :VoomToggle<CR>
    let g:voom_return_key = "<Tab>"
    let g:voom_tab_key = "<C-Tab>"
    let g:voom_ft_modes = {
                \'vimwiki':'markdown',
                \}
endif

" YouCompleteMe
if match(bundle_name, 'YouCompleteMe') >= 0
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
    let g:ycm_filetype_blacklist = {}
    " XXX: After YouCompleteMe prompt, it disables <C-u>, following line hacks
    " to work around this problem. But later I found it breaks insertion in block
    " visual mode. Now the only way I can think of is to map another key
    " binding to <C-u> :(
    "inoremap <Space> <Space><C-o><Esc>
endif

" ctrlp
if match(bundle_name, 'ctrlp') >= 0
    let g:ctrlp_map = '<Leader><Leader>'
    "nnoremap <Leader>p :CtrlP<CR>
    nnoremap <Leader>pp :CtrlP<CR>
    nnoremap <Leader>pb :CtrlPBuffer<CR>
    nnoremap <Leader>pm :CtrlPMRU<CR>
    nnoremap <Leader>bb :CtrlPBuffer<CR>
    nnoremap <Leader>mm :CtrlPMRU<CR>
    let g:ctrlp_working_path_mode = 2
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$' }

    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'find %s -type f'
    \ }
endif

" vim-fugitive
if match(bundle_name, 'vim-fugitive') >= 0
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gc :Gcommit<CR>
    nnoremap <Leader>ga :Gcommit -a<CR>
    nnoremap <Leader>gp :Git push<CR>
    nnoremap <Leader>gd :Gdiff<CR>
endif

" delimitMate
if match(bundle_name, 'delimitMate') >= 0
    "set matchpairs+=<:>
    let delimitMate_expand_space = 1
    let delimitMate_expand_cr = 1
    imap <C-g><C-l> <Plug>delimitMateS-Tab
    imap <C-g><C-g> <Plug>delimitMateJumpMany
    autocmd FileType tex let b:delimitMate_quotes = "\" ' ` $"
    "imap <Space> <Plug>delimitMateSpace
    "autocmd FileType vimwiki let b:delimitMate_matchpairs=&matchpairs
    "autocmd FileType vimwiki let b:delimitMate_quotes = "\" ' ` * -"
    "autocmd FileType vimwiki let b:delimitMate_nesting_quotes = ['"','*','-',"'",'`']
    "autocmd FileType c,cpp,java let b:delimitMate_matchpairs=&matchpairs.",=:;"
endif

" matchit.zip
if match(bundle_name, 'matchit.zip') >= 0
    "let b:match_words = '<:>,\<if\>:\<else\>:\<endif\>'
endif

" vim-powerline
if match(bundle_name, 'vim-powerline') >= 0
    set laststatus=2
    let g:Powerline_symbols = 'fancy'
    let g:Powerline_stl_path_style = 'short'
endif

" tagbar
if match(bundle_name, 'tagbar') >= 0
    let g:tagbar_sort = 0
    "autocmd Filetype tagbar,c,cpp,python,ruby,vim nnoremap <buffer> <Tab> :TagbarToggle<CR>
    " following 3 lines make tagbar autofocus only when using :TagbarToggle, 
    " but not when using :TagOpen
    let g:tagbar_autofocus = 0
    nnoremap <silent> <M-p> :TagbarToggle<CR>
    autocmd Filetype c,cpp,python :TagbarOpen
    autocmd Filetype tagbar nmap <buffer> <C-j> jp
    autocmd Filetype tagbar nmap <buffer> <C-k> kp
    let g:tagbar_type_vimwiki = {
        \ 'ctagstype': 'vimwiki',
        \ 'kinds': [
            \ 'w:[[ WikiLinks ]]:0:0',
            \ 'h:# Heading_L1:0',
            \ 'i:## Heading_L2:1',
            \ 'j:### Heading_L3:1',
            \ 'k:#### Heading_L4:1',
            \ 'l:##### Heading_L5:1',
            \ 'm:###### Heading_L6:1',
            \ ],
        \ }
    let g:tagbar_type_mytype = {
        \ 'ctagstype': 'Python',
        \ 'kinds': [
            \ 'i:imports:1:0',
            \ 'c:classes',
            \ 'f:functions',
            \ 'm:members',
            \ 'v:variables:0:0',
            \ ],
        \ 'sro': '@',
        \ 'kind2scope': {
            \ 'c': 'class',
            \ 'm': 'member',
            \ 'v': 'variable',
            \ },
        \ 'scope2kind': {
            \ 'class': 'c',
            \ 'member': 'm',
            \ 'variable': 'v',
            \ },
        \ }
endif

" nerdcommenter
if match(bundle_name, 'nerdcommenter') >= 0
    "nerdcommenter defined key map, replicated here to avoid overwrite
    "nnoremap <Leader>cc <Plug><NERDCommenterNested
    "nnoremap <Leader>ca <Plug><NERDCommenterAltDelims
    "nnoremap <Leader>cu <Plug><NERDCommenterUncomment
    "nnoremap <Leader>cb <Plug><NERDCommenterAlignBoth
    "nnoremap <Leader>cl <Plug><NERDCommenterAlignLeft
    "nnoremap <Leader>cA <Plug><NERDCommenterAppend
    "nnoremap <Leader>cy <Plug><NERDCommenterYank
    "nnoremap <Leader>cs <Plug><NERDCommenterSexy
    "nnoremap <Leader>ci <Plug><NERDCommenterInvert
    "nnoremap <Leader>c$ <Plug><NERDCommenterToEOL
    "nnoremap <Leader>cm <Plug><NERDCommenterMinimal
    "nnoremap <Leader>cn <Plug><NERDCommenterNested
    "nnoremap <Leader>c<space> <Plug><NERDCommenterToggle
endif

" nerdtree
if match(bundle_name, 'nerdtree') >= 0
    "nnoremap <leader>e :NERDTreeTabsOpen<CR>:NERDTreeSteppedClose<CR>:NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    "let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=0
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
endif

" undotree
if match(bundle_name, 'undotree') >= 0
    let g:undotree_SetFocusWhenToggle=1
endif

" YankRing.vim
if match(bundle_name, 'YankRing.vim') >= 0
    "let g:yankring_replace_n_pkey = '<M-p>'
    "let g:yankring_replace_n_nkey = '<M-n>'
    "let g:yankring_zap_keys = '/ ?'
    "let g:yankring_manage_numbered_reg = 1
    "nnoremap <Leader>yc :YRClear<CR>
    "function! YRRunAfterMaps()
        "nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
    "endfunction
endif

" tabular
if match(bundle_name, 'tabular') >= 0
    " :Tabularize /:/l1r0
    " algin by :, insert 1 space to left, and 0 to right.default to l1r1
    "nnoremap <Leader>a& :Tabularize /&<CR>
    "vmap <Leader>a& :Tabularize /&<CR>
    "nnoremap <Leader>a= :Tabularize /=<CR>
    "vmap <Leader>a= :Tabularize /=<CR>
    "nnoremap <Leader>a: :Tabularize /:<CR>
    "vmap <Leader>a: :Tabularize /:<CR>
    "nnoremap <Leader>a:: :Tabularize /:\zs<CR>
    "vmap <Leader>a:: :Tabularize /:\zs<CR>
    "nnoremap <Leader>a, :Tabularize /,<CR>
    "vmap <Leader>a, :Tabularize /,<CR>
    "nnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
    "vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif

" sessionman.vim
if match(bundle_name, 'sessionman.vim') >= 0
    set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
    nnoremap <leader>sl :SessionList<CR>
    nnoremap <leader>ss :SessionSave<CR>
endif

" cscope conf
if has("cscope")
     " use both cscope and ctag for 'ctrl-]', ':ta', 'vim'
     set cscopetag
     " search cscope first, then ctags
     set csto=0
     " add cscope database
     set nocsverb
     if filereadable("cscope.out")
         cscope add cscope.out
     elseif $CSCOPE_DB != ""
         cscope add $CSCOPE_DB
     endif
     set csverb
     " s - symbol
     " g - definition
     " d - functions called by this function"
     " c - functions calling this function
     " t - text string"
     " e - egrep pattern"
     " f - file
     " i - files #including this file"
     " normal mode map for cscope
     nnoremap <Leader>ps :cscope find s <C-R>=expand("<cword>")<CR>
     nnoremap <Leader>pg :cscope find g <C-R>=expand("<cword>")<CR>
     nnoremap <Leader>pd :cscope find d <C-R>=expand("<cword>")<CR>
     nnoremap <Leader>pc :cscope find c <C-R>=expand("<cword>")<CR>
     nnoremap <Leader>pt :cscope find t <C-R>=expand("<cword>")<CR>
     nnoremap <Leader>pe :cscope find e <C-R>=expand("<cword>")<CR>
     nnoremap <Leader>pf :cscope find f <C-R>=expand("<cfile>")<CR>
     nnoremap <Leader>pi :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
     " visual mode map for cscope
     vnoremap <Leader>ps :<C-u>cscope find s <C-R>*<CR>
     vnoremap <Leader>pg :<C-u>cscope find g <C-R>*<CR>
     vnoremap <Leader>pd :<C-u>cscope find d <C-R>*<CR>
     vnoremap <Leader>pc :<C-u>cscope find c <C-R>*<CR>
     vnoremap <Leader>pt :<C-u>cscope find t <C-R>*<CR>
     vnoremap <Leader>pe :<C-u>cscope find e <C-R>*<CR>
     vnoremap <Leader>pf :<C-u>cscope find f <C-R>*<CR>
     vnoremap <Leader>pi :<C-u>cscope find i ^<C-R>*$<CR>
endif

