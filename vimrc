" Name:         Vim Configuration of yuex
" Language:     vimscript
" Maintainer:   yuex <yuecn41@gmail.com>
" Source:       http://github.com/yuex/dotfiles

" vundle {{{
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
" general {{{
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

    Bundle 'bling/vim-bufferline'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tomasr/molokai'
    Bundle 'mileszs/ack.vim'
" }}}
" programming {{{
    " git integration
    Bundle 'tpope/vim-fugitive'
    " automatic syntax checker
    Bundle 'scrooloose/syntastic'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'majutsushi/tagbar'
    Bundle 'Yggdroot/indentLine'
    Bundle 'sukima/xmledit'
    "Bundle 'willthefrog/indentLine'
    " use astyle for C#/C++/C/Java, jsbeautify for Javascript
    " autopep8 for python, tidy for HTML/XHTML/XML
    "Bundle 'Chiel92/vim-autoformat'
    "Bundle 'einars/js-beautify'
" }}}
" snippet and autocomplete {{{
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
    "Bundle 'HTML-AutoCloseTag'
"}}}
" notetaking {{{
    "Bundle 'vimwiki/vimwiki'
    Bundle 'kakkyz81/evervim' 
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
" }}}
" }}}
" general options {{{
" editing {{{
    set autowrite
    set virtualedit=onemore
    set formatoptions+=mM
    set iskeyword-=_
" }}}
" word {{{
    "set spell spelllang=en
    "set dictionary=/usr/local/plan9/lib/words
    "set complete-=k complete+=k
" }}}
" encoding {{{
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8,default,chinese
" }}}
" ruler and status line {{{
    set ruler
    set number
    set showcmd
    set showmode
    set cursorline  " hightlight current line
    set laststatus=2
" }}}
" search {{{
    set hlsearch    " disable with :nohl
    set ignorecase  " dont differ between case
    set smartcase   " override ignorecase when uppercase occurs
    set incsearch   " incremental search
    set wrapscan    " wrapscan = wrap to top when reach end
" }}}
" screen scroll {{{
    set scrolljump=5        " lines to scroll when cursor leaves screen
    set scrolloff=3        " minimum lines to keep around the cursor
" }}}
" indent {{{
    "set nowrap
    set autoindent
    "set smartindent
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set expandtab
" }}}
" fold {{{
    set foldmethod=indent
    set foldopen+=insert
" }}}
" listchars {{{
    "set listchars=tab:,.,trail:.,extends:#,nbsp:.
    set listchars=tab:×·,trail:·,extends:#,nbsp:.
" }}}
" color scheme {{{
    set bg=dark
    "set t_Co=256
    syntax on
    " solarized needs termianl palette configured properly
    " checkout
    colorscheme solarized
    "colorscheme molokai
    "let g:solarized_termcolors=256
    "let g:solarized_termtrans=1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
" }}}
" }}}
" keymapping {{{
" leader {{{
    let mapleader = ';'
    let maplocalleader = ','
    noremap <Esc>; :
    inoremap <Esc>; <C-o>:
    noremap \ ;
    noremap <C-\> ,
" }}}
" meta key {{{
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
" }}}
" folding level {{{
    for lvl in range(0,9)
        exec "nnoremap <unique> <Leader>z".lvl." :set foldlevel=".lvl."<CR>"
    endfor
" }}}
" change cd {{{
    cnoremap <unique> cwd lcd %:p:h
    cnoremap <unique> cd. lcd %:p:h
" }}}
" sudo {{{
" when u forget to sudo.. really write the file
    cnoremap <unique> w!! w !sudo tee % >/dev/null
" }}}
" smartquit {{{
    "nnoremap <C-c> :confirm q<CR>
    "nnoremap <C-c> :q<CR>
    " function SmartQuit()  {{{
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
                " one line echo
                "echoerr matchstr(v:exception, '\(Vim(.*):\)\@<=.*')
                echoerr v:exception
                return
            endtry
        endif
    endfunc
    " }}}
    nnoremap <unique> <C-c> :call SmartQuit()<CR>
" }}}
" tabpage {{{
    " move to previous or next tab, <Esc> for <M-
    " XXX: use dict to implement this kind mapping. map-nvo and map-i
    " XXX: tips for easy memorizing. <Left> and <Right> are intuitive. for Up
    " and Down, note that some laptop keyboard designs squeeze <Home> and
    " <End> " to <Up> and <Down>, <Home> for create, <End> for close
    nnoremap <unique> <silent> <C-g><C-t>   :tabs<CR>
    nnoremap <unique> <silent> <C-g><C-h> :tabprevious<CR>
    nnoremap <unique> <silent> <C-g><C-l> :tabnext<CR>
    nnoremap <unique> <silent> <C-g><C-j> :tabnew<CR>
    nnoremap <unique> <silent> <C-g><C-k> :tabclose<CR>
    nnoremap <unique> <silent> <Left>  :tabprevious<CR>
    nnoremap <unique> <silent> <Right> :tabnext<CR>
    nnoremap <unique> <silent> <Down>  :tabnew<CR>
    nnoremap <unique> <silent> <Up>    :tabclose<CR>

    inoremap <unique> <silent> <Left>  <nop>
    inoremap <unique> <silent> <Right> <nop>
    inoremap <unique> <silent> <Up>    <nop>
    inoremap <unique> <silent> <Down>  <nop>
    " move tab left or right
    nnoremap <unique> <Esc><PageUp>   :tabmove -1<CR>
    nnoremap <unique> <Esc><PageDown> :tabmove +1<CR>
    "inoremap <unique> <Esc><PageUp>   <Esc>:tabmove -1<CR>
    "inoremap <unique> <Esc><PageDown> <Esc>:tabmove +1<CR>
    " move to tab #1-#9, #0 is last"
    nnoremap <unique> <C-g>0 :tablast<CR>
    inoremap <unique> <C-g>0 <C-o>:tablast<CR>
    let c = '1'
    while c <= '9'
        exec "nnoremap <unique> <C-g>".c." :tabnext ".c."<CR>"
        exec "inoremap <unique> <C-g>".c." <Esc>:tabnext ".c."<CR>"
        let c = nr2char(1+char2nr(c))
    endw
" }}}
" buffer {{{
    nnoremap <unique> <silent> <C-g><C-u>   :buffers<CR>
    nnoremap <unique> <silent> <C-g><C-p>   :bprevious<CR>
    nnoremap <unique> <silent> <C-g><C-n>   :bnext<CR>
    "nnoremap <unique> <silent> <PageUp>     :bprevious<CR>
    "nnoremap <unique> <silent> <PageDown>   :bnext<CR>

    inoremap <unique> <silent> <C-g><C-p>   <Esc>:bprevious<CR>
    inoremap <unique> <silent> <C-g><C-n>   <Esc>:bnext<CR>
    "inoremap <unique> <silent> <PageUp>     <Esc>:bprevious<CR>
    "inoremap <unique> <silent> <PageDown>   <Esc>:bnext<CR>

    nnoremap <unique> <M-0> :blast<CR>
    inoremap <unique> <M-0> <C-o>:blast<CR>
    let c = '1'
    while c <= '9'
        exec "nnoremap <unique> <M-".c."> :buffer ".c."<CR>"
        exec "inoremap <unique> <M-".c."> <Esc>:buffer ".c."<CR>"
        let c = nr2char(1+char2nr(c))
    endw
" }}}
" toggle options {{{
    inoremap <unique> <M-m> <C-o>:setlocal number!<CR>
    nnoremap <unique> <M-m> :setlocal number!<CR>
    "nnoremap <M-r> :vertical resize 80<CR>
    inoremap <unique> <M-s> <C-o>:setlocal hlsearch!<CR>
    nnoremap <unique> <M-s> :setlocal hlsearch!<CR>
" }}}
" jkTF motion {{{
    " go as u see
    noremap <unique> j gj
    noremap <unique> k gk
    map <unique> gt T
    map <unique> gf F
" }}}
" }}}
" autocommand {{{
    " set filetype for *.conf
    "autocmd BufRead,BufNewFile *.conf setfiletype conf
" autocmd executable {{{
    autocmd BufNewFile *.py call append(0,"#!/usr/bin/env python")
    autocmd BufNewFile *.rb call append(0,"#!/usr/bin/env ruby")
    autocmd BufNewFile *.tcl call append(0,"#!/usr/bin/env tclsh")
    autocmd BufNewFile *.sh call append(0,"#!/usr/bin/env sh")
    autocmd BufNewFile *.lisp call append(0,"#!/usr/bin/env clisp")

    autocmd BufWritePost *.sh,*.py,*.rb,*.tcl,*.lisp
                \  exec "!chmod a+x %"
                \| exec "redraw"
" }}}
" autocmd make {{{
    " quick :make
    nnoremap <unique><silent> <F5> :make!<CR>
    " hack for python2 on archlinux
    autocmd FileType python
                \ nnoremap <unique><silent><buffer> <F6> :!python2 %<CR>
    autocmd FileType python set makeprg=python\ %
    autocmd FileType ruby set makeprg=ruby\ %
    autocmd FileType tcl set makeprg=tclsh\ %
    autocmd FileType sh set makeprg=bash\ %
    autocmd FileType lisp set makeprg=clisp\ %
    autocmd FileType tex set makeprg=pdflatex\ %
    autocmd FileType c set makeprg=gcc\ -Wall\ -o%<\ %;./%<
    autocmd FileType haskell set makeprg=runhaskell\ %
    autocmd Filetype go set makeprg=go\ run\ %
" }}}
" autocmd indent {{{
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType xml,html,css,htmldjango
                \ setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType make setlocal noexpandtab
" }}}
" }}}
" hacks {{{
" quickmotion {{{
    " function SmartMove() {{{
    function SmartMove(moveToNext, moveToEnd, ...)
        " if line number changed, use moveToEnd, otherwise use moveToNext
        " will ensure cursor get changed to avoid deadlock
        " a:type to deal with visualmode
        if a:0 > 0
            let a:type = a:1
        endif
        let prevpos = getpos('.')
        let line = prevpos[1]
        let col  = prevpos[2]

        if exists("a:type")
            let prefix = 'gv'
        else
            let prefix = ''
        endif

        if col ==# col('$')
            exec "normal! " . prefix . a:moveToNext
            return
        endif

        exec "normal! " . prefix . a:moveToNext
        if line !=# line('.')
            call setpos('.', prevpos)
            exec "normal! " . prefix . a:moveToEnd
            if prevpos ==# getpos('.')
                exec "normal! " . prefix. a:moveToNext
            endif
        endif
    endfunc
    " }}}
    " common motion {{{
    "noremap! <unique> <C-a> <Home>
    "noremap! <unique> <C-e> <End>
    "noremap! <unique> <C-h> <Left>
    "noremap! <unique> <C-l> <Right>
    "noremap! <unique> <M-b> <S-Left>
    "noremap! <unique> <M-f> <S-Right>
    "noremap! <unique> <M-h> <BS>
    "noremap! <unique> <M-l> <Del>
    " }}}
    " quickinsert inoremap {{{
    " it seems <C-Left> and <C-Right> in insert mode
    inoremap <unique> <C-a> <C-o>^
    inoremap <unique> <C-e> <End>
    inoremap <unique> <C-h> <Left>
    inoremap <unique> <C-l> <Right>
    inoremap <unique> <M-b> <C-o>:call SmartMove('b','gel')<CR>
    inoremap <unique> <M-f> <C-o>:call SmartMove('w','el')<CR>
    inoremap <unique> <M-h> <BS>
    inoremap <unique> <M-l> <Del>

    inoremap <unique> <Esc><C-h> <C-o>:call SmartMove('B','gEl')<CR>
    inoremap <unique> <Esc><C-l> <C-o>:call SmartMove('W','$l')<CR>

    inoremap <unique> <C-j> <C-o>g<Down>
    inoremap <unique> <C-k> <C-o>g<Up>
    inoremap <unique> <M-e> <C-o>e<Right>
    inoremap <unique> <Esc><C-j> <C-o>}
    inoremap <unique> <Esc><C-k> <C-o>{

    inoremap <unique> <C-u> <C-o>d0
    inoremap <unique> <M-u> <C-o>d$
    inoremap <unique> <Esc><C-u> <C-o>d^
    "inoremap <unique> <Esc><C-k> <C-o>d$
    "inoremap <unique> <C-w> <C-o>db
    inoremap <unique> <M-d> <C-o>de
    inoremap <unique> <M-w> <C-o>de
    inoremap <unique> <C-y> <C-r>-
    inoremap <unique> <C-s> <C-o>d
    inoremap <unique> <C-s>u <C-o>u

    inoremap <unique> <M-a> <C-o><C-a>
    inoremap <unique> <M-x> <C-o><C-x>

    inoremap <unique> <M-v> <C-o>v
    " }}}
    " quickcmd {{{
    "cnoremap <C-o> <C-f>, set cedit=
    set cedit=<C-o>
    set cmdwinheight=3
    noremap : :<C-o><C-c>

    cnoremap <unique> <C-a> <C-o>^<C-c>
    cnoremap <unique> <C-e> <End>
    cnoremap <unique> <C-h> <Left>
    cnoremap <unique> <C-l> <Right>
    cnoremap <unique> <M-b> <C-o>b<C-c>
    cnoremap <unique> <M-f> <C-o>w<C-c>
    cnoremap <unique> <M-h> <BS>
    cnoremap <unique> <M-l> <Del>

    cnoremap <unique> <M-n> <Down>
    cnoremap <unique> <M-p> <Up>
    cnoremap <unique> <M-j> <Down>
    cnoremap <unique> <M-k> <Up>
    " noremap! <S-Left> isn't enough for c-mode

    cnoremap <unique> <C-j> <C-n>
    cnoremap <unique> <C-k> <C-p>
    cnoremap <unique> <M-e> <C-o>el<C-c>
    cnoremap <unique> <Esc><C-h> <C-o><C-Left><C-c>
    cnoremap <unique> <Esc><C-l> <C-o><C-Right><C-c>

    cnoremap <unique> <C-u> <C-o>d0<C-c>
    cnoremap <unique> <M-u> <C-o>d$<C-c>
    cnoremap <unique> <Esc><C-u> <C-o>d^<C-c>
    cnoremap <unique> <Esc><C-k> <C-o>d$<C-c>
    cnoremap <unique> <C-w> <C-o>db<C-c>
    cnoremap <unique> <M-d> <C-o>de<C-c>
    cnoremap <unique> <M-w> <C-o>de<C-c>
    cnoremap <unique> <C-y> <C-r>-
    cnoremap <unique> <C-s> <C-o>d

    cnoremap <unique> <M-a> <C-o><C-a><C-c>
    cnoremap <unique> <M-x> <C-o><C-x><C-c>
    "cnoremap <C-w> <C-c><C-w>
    " }}}
    " quicknormal {{{
    noremap <unique> <C-a> ^
    noremap <unique> <C-e> <End>
    noremap <unique> <C-h> <Left>
    noremap <unique> <C-l> <Right>
    noremap <unique> <C-j> g<Down>
    noremap <unique> <C-k> g<Up>
    noremap <unique> <Esc><C-b> <S-Left>
    noremap <unique> <Esc><C-f> <S-Right>
    noremap <unique> <Esc><C-w> w
    noremap <unique> <Esc><C-e> e
    noremap <unique> <Esc><C-j> }
    noremap <unique> <Esc><C-k> {

    nnoremap <unique> <M-b> :<C-u>call SmartMove('b','gel')<CR>
    nnoremap <unique> <M-f> :<C-u>call SmartMove('w','el')<CR>
    nnoremap <unique> <Esc><C-h> :<C-u>call SmartMove('B','gEl')<CR>
    nnoremap <unique> <Esc><C-l> :<C-u>call SmartMove('W','El')<CR>
    vnoremap <unique> <M-b> <Esc>:<C-u>call SmartMove('b','gel',visualmode())<CR>
    vnoremap <unique> <M-f> <Esc>:<C-u>call SmartMove('w','el',visualmode())<CR>
    vnoremap <unique> <Esc><C-h> <Esc>:<C-u>call SmartMove('B','gEl',visualmode())<CR>
    vnoremap <unique> <Esc><C-l> <Esc>:<C-u>call SmartMove('W','El',visualmode())<CR>

    nnoremap <unique> Y y$

    nnoremap <unique> <M-a> <C-a>
    nnoremap <unique> <M-x> <C-x>

    noremap <unique> <M-h> X
    noremap <unique> <M-l> x
    " }}}
" }}}"
" quick shift {{{
    vnoremap <unique> <Esc>, <gv
    vnoremap <unique> <Esc>. >gv
    vnoremap <unique> < <gv
    vnoremap <unique> > >gv
    " use <c-d> and <c-t> in i-mode to keep cursor's position
    inoremap <unique> <Esc>, <C-d>
    inoremap <unique> <Esc>. <C-t>
    nnoremap <unique> <Esc>, a<C-d><Esc>
    nnoremap <unique> <Esc>. a<C-t><Esc>
    cnoremap <unique> <Esc>, <C-o>i<C-d><C-c>
    cnoremap <unique> <Esc>. <C-o>i<C-t><C-c>
" }}}
" quicksearch, easysearch {{{
    " function Searchlist() {{{
    " search result to list
    function Searchlist(pattern, flag)
        let @/ = a:pattern
        exec 'lvimgrep /'.a:pattern.'/'.a:flag.' %'
        call QuickfixToggle('l')
    endfun
    " }}}
    " search and visual select (..) and )..( {{{
    " checkout vim-textobj-user
    "for c in add(split('(:),[:],{:},<:>,*:*,-:-,":"',','),"':'")
        "let [s,e] = split(c,':')
        "let switched = 0
        "while 1
            "let s_re = escape(s, '[\^$.*')
            "let e_re = escape(e, ']\^$.*')
            "let i_re = s_re.'\zs[^'.escape(e.s,'^]\').']*\ze'.e_re
            "let a_re = '\zs'.s_re.'[^'.escape(e.s,'^]\').']*'.e_re.'\ze'
            "let mycount = v:count > 1 ? v:count : ''

            "" use \i* and \a* to search for next **
            "" use |i* and |a* to search for prev **
            "" preceding count is supported
            "exec "noremap \\i".s." ".mycount."/".i_re."<CR>"
            "exec 'noremap \|i'.s." ".mycount."?".i_re."<CR>"
            "exec "noremap \\a".s." ".mycount."/".a_re."<CR>"
            "exec 'noremap \|a'.s." ".mycount."?".a_re."<CR>"

            "" self-defined text object
            "" va* and vi* to select between **
            "" I know it's some dirty hacks, but easy to be converted into a
            "" plugin or so. Maybe some time later when I get the mood
            "" it's actually some scripted version of following mappings
            "" vnoremap a* :<C-u>set nows<CR>v?\*<CR>o/\*<CR>:<C-u>set ws<CR>gv
            "" vnoremap i* :<C-u>set nows<CR>v?\*\zs?e+1<CR>o/\ze\*/e-1<CR>:<C-u>set ws<CR>gv
            "exec 'vnoremap a'.s.' '.
                        "\':<C-u>set nows<CR>
                        "\v?'.s_re.'<CR>
                        "\o/'.e_re.'<CR>
                        "\:<C-u>set ws<CR>
                        "\gv'
            "exec 'vnoremap i'.s.' '.
                        "\':<C-u>set nows<CR>
                        "\v?'.s_re.'<CR>l
                        "\o/'.e_re.'<CR>h
                        "\:<C-u>set ws<CR>
                        "\gv'

            "" a simple check to support (:) and ):( automatically
            "" so you don't need to manually put ):( in the for loop
            "if s ==# e || switched
                "break
            "else
                "let [s,e] = [e,s]
                "let switched = 1
            "endif
        "endw
    "endfor
    "for off in split('e:s:b','\zs')
        "exec "vnoremap v".off." //".off."<CR>"
    "endfor
    " }}}
    " visual mode * and # {{{
    " Search for visual selected text, forwards or backwards.
    " visual select text, use * for forwards and # for backwards searching
    " n and N to go next and prev
    " stolen from http://vim.wikia.com/wiki/Search_for_visually_selected_text
    vnoremap <unique><silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
    vnoremap <unique><silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
    " }}}
" }}}"
" quickpaste, quickcopy {{{
    "set pastetoggle=<Esc><C-p>
    set pastetoggle=<M-p>
    vnoremap <unique> <Esc><C-y> "+y
    nnoremap <unique> <Esc><C-y> "+yy
    " paste before the curor
    nnoremap <unique> <Esc><C-v> "+P
    " paste after the curor, rare case
    "nnoremap <unique> <Esc><C-p> "+p
    inoremap <unique> <Esc><C-v> <C-o>"+P
" }}}
" quickwindow {{{
    "nnoremap <C-w><C-m> :vnew<CR>
    "nnoremap <C-w>m     :vnew<CR>
    noremap <unique> <C-w><C-n>\|     :vnew<CR>
    noremap <unique> <C-w><C-n>_     :new<CR>
    noremap <unique> <C-w>_ <C-w><C-s>
    noremap <unique> <C-w>\| <C-w><C-v>
    noremap <unique> <C-w>== <C-w>=
    noremap <unique> <C-w>=_ <C-w>_
    noremap <unique> <C-w>=\| <C-w>\|

    "noremap! <M-w> <C-c><C-w>w
    "noremap! <M-r> <C-c><C-w>W
    "noremap! <M-o> <C-c><C-w><C-p>
    noremap <unique> <M-w> <C-w>w
    noremap <unique> <M-r> <C-w>W
    noremap <unique> <M-o> <C-w><C-p>
    noremap <unique> <C-w><C-o> <C-w><C-p>
    noremap <unique> <C-w><M-o> <C-w><C-o>

    noremap <unique> <C-w>+ 5<C-w>+
    noremap <unique> <C-w>- 5<C-w>-
    noremap <unique> <C-w>< 5<C-w>>
    noremap <unique> <C-w>> 5<C-w><

    noremap <unique> <C-w>o <C-w>w
    noremap <unique> <C-w>O <C-w>W
    noremap <unique> <C-w><C-t> <C-w>T
" }}}
" mottos" {{{
    let g:mottos_prompt = "省» "
    noremap <unique><silent> <C-s>
                \ :<C-u>echoh Question
                \\| echo g:mottos_prompt.substitute(system('mottos',&winwidth-strlen(g:mottos_prompt)),'','','')
                \\| echoh None<CR>
" }}}
" quickfix {{{
    " function QuickfixToggle() {{{
    " todo, fixme, and xxx vimgrep
    function QuickfixToggle(type)
        let flagname = 'b:quickfix_'.a:type.'_opened'
        let cmdopen = a:type.'window'
        let cmdclose = a:type.'close'
        if !exists(flagname)
            exec "let ".flagname." = 0"
        endif
        exec "let flag = ".flagname
        if flag == 0
            " in the cmd invode window
            exec "let ".flagname." = 1 "
            exec cmdopen
            " in the quickfix window
            exec "let ".flagname." = 1 "
        elseif flag == 1
            " in the cmd invode window
            exec "let ".flagname." = 0 "
            exec cmdclose
            " in the quickfix window
            exec "let ".flagname." = 0 "
        endif
    endfunc
    " }}}
    " function QuickfixCompile() {{{
    function QuickfixCompile(type)
        let flagname = 'b:quickfix_' . a:type . '_compiled'
        if !exists(flagname)
            exec "let " . flagname . " = 0"
        endif
        exec "let flag = " . flagname
        if flag == 1 || &ft ==# 'qf'
            return
        endif
        if flag == 0
            let grep_cmd = 'vimgrep /\vTODO|FIXME|XXX/ %'
            if a:type ==# 'l'
                let grep_cmd = a:type . grep_cmd
            endif
            try
                exec grep_cmd
            catch
                " e.g., not saved file
                echoerr v:exception
                return
            endtry
            exec "let " . flagname . " = 1"
        endif
    endfunc
    " }}}
    "nnoremap <unique> <Leader>td :vimgrep /TODO\\|FIXME\\|XXX/ %<CR>
                "\ :call QuickfixToggle('c')<CR>
    "nnoremap <unique> <Leader>ld :lvimgrep /TODO\\|FIXME\\|XXX/ %<CR>
                "\ :call QuickfixToggle('l')<CR>
    nnoremap <unique> <Leader>tt :call QuickfixCompile('c')<CR>
                \ :call QuickfixToggle('c')<CR>
    nnoremap <unique> <Leader>ll :call QuickfixCompile('l')<CR>
                \ :call QuickfixToggle('l')<CR>
    nnoremap <unique> <Leader>tn :cnext<CR>
    nnoremap <unique> <Leader>tp :cprev<CR>
    nnoremap <unique> <Leader>ln :lnext<CR>
    nnoremap <unique> <Leader>lp :lprev<CR>
" }}}
" quick deletion using <C-s> {{{
    "inoremap <unique> <C-s><C-a> <C-o>d<Home>
    "inoremap <unique> <C-s><C-e> <C-o>d<End>
    "inoremap <unique> <C-s><C-w> <C-o>dB
    "inoremap <unique> <C-s><C-d> <C-o>dW
    "inoremap <unique> <C-s><M-w> <C-o>dB
    "inoremap <unique> <C-s><M-d> <C-o>dW
    "inoremap <unique> <C-s><Esc>e <C-o>de
    "inoremap <unique> <C-s><Esc><C-e> <C-o>dge
    "inoremap <unique> <C-s><C-f> <C-o>dw
    "inoremap <unique> <C-s><C-b> <C-o>db
    "inoremap <unique> <C-s><C-u> <C-o>d^
    "inoremap <unique> <C-s><C-k> <C-o>d$
    "inoremap <unique> <C-s><C-d> <C-o>d
    "inoremap <unique> <C-s>u <C-o>u
    "inoremap <unique> <C-s><C-y> <C-o>P
    "inoremap <unique> <C-s><C-j> <C-o>J
    "inoremap <unique> <C-q> <BS>
    "inoremap <unique> <M-q> <Del>
    "inoremap <unique> <Esc><C-q> <Del>
" }}}
" strip space at the end of line {{{
    " functoin AutoSpaceCJK() {{{
    function! AutoSpaceCJK(mode)
        "let range = "'" . 'A-Z0-9a-z~!@#$%\^&*()_+`-=\[\]{}:;"<>,./?\\|'
        let pat_range = '"'
                    \. "A-Z0-9a-z~!@#$%^&*()=_+`[{}:;". "'<>,./?|"
                    \. "\\-\\]\\\\"
        let pat_no = '[^ ' . pat_range . ']'
        let pat_ya =  '[' . pat_range . ']'

        let range = ''

        if a:mode == 'v' || a:mode ==# ''
            let range = "'<,'>"
        elseif a:mode ==# 'n'
            let range = '.'
        endif

        "echom range
        "echom range_no
        "echom range_ya

        "exec 'substitute/\v\S\zs(' . range_ya . '+)\ze\S/ \1 /g'
        exec range . 'substitute/\v'. pat_no .'\zs(' . pat_ya . ')\ze/ \1/ge'
        exec range . 'substitute/\v\zs('. pat_ya .')\ze' . pat_no . '/\1 /ge'
        redraw!
    endfunc
    " }}}
    nnoremap <unique> <Leader>fs :retab<CR>:%s/\s\+$//g<CR>``
    nnoremap <unique> <Leader>fc gg=G
    nnoremap <unique> <Leader>ff :call AutoSpaceCJK('n')<CR>
    vnoremap <unique> <Leader>ff :<C-u>call AutoSpaceCJK(visualmode())<CR>
" }}}
" zz, zt, zb, place current line on screen {{{
    for key in ['z','t','b']
        exec "inoremap <unique> <C-z><C-".key."> <C-o>z".key
        exec "inoremap <unique> <C-z>".key." <C-o>z".key
    endfor
    for key in ['H','L','M']
        exec "inoremap <unique> <C-z>".key." <C-o>".key
    endfor
    nnoremap <unique> zh zt
    nnoremap <unique> zl zb
    vnoremap <unique> zh zt
    vnoremap <unique> zl zb
    inoremap <unique> <C-z>h <C-o>zt
    inoremap <unique> <C-z>l <C-o>zb
    inoremap <unique> <C-z><C-h> <C-o>zt
    inoremap <unique> <C-z><C-l> <C-o>zb
" }}}
" exec function in insert mode {{{
    " insert mode <C-r>=Funcexec(cmd)
    " used to execute normal commands in insert mode without leaving
    function Funcexec(cmd)
        exec a:cmd
    endfun
" }}}
" }}}
" plugins {{{
" function PluginInstalled {{{
" PluginInstalled("plugin name")
" PluginInstalled("plugin name",g:bundle_name)
" return 1 or 0
function PluginInstalled(plugin,...)
    " if g:bundle_name doesn't exist, create it
    if !exists("g:bundle_name")
        let g:bundle_name = map(copy(g:bundles), 'v:val.name')
    endif
    if a:0 == 0
        let installed = g:bundle_name
    else
        let installed = a:1
    endif
    if match(installed, a:plugin) >= 0
        return 1
    endif
    return 0
endfun
" }}}
" project.tar.gz {{{
"if match(g:bundle_name, 'project.tar.gz') >= 0
if PluginInstalled('project.tar.gz')
    nnoremap <unique> <M-g> <Plug>ToggleProject
endif
" }}}
" easymotion and insert mode motion {{{
if PluginInstalled('vim-easymotion')
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
        exec "map <unique> ".key." <Plug>(easymotion-iskeyword-".key.")"
        if strlen(key) != 1 || key < 'a' || key > 'z'
            continue
        endif
        exec "imap <unique> <Esc><C-".key."> <C-o><Plug>(easymotion-iskeyword-".key.")"
    endfor
    for key in ['j','k']
        exec "map  <unique> <M-".key."> <Plug>(easymotion-".key.")"
        exec "imap <unique> <M-".key."> <C-o><Plug>(easymotion-".key.")"
    endfor
    "for key in ['t','T','f','F','w','b','e','W','B','E',"ge","gE"]
        "let act = key

        "if key ==# 'w' || key ==# 'b' || key ==# 'e' || key ==# 'ge'
            "let act = "iskeyword-".key
        "endif

        "exec "map <unique> ".key." <Plug>(easymotion-".act.")"

        "if strlen(key) != 1 || key < 'a' || key > 'z'
            "continue
        "else
            "exec "imap <unique> <Esc><C-".key."> <C-o><Plug>(easymotion-".act.")"
        "endif
    "endfor
endif
" }}}
" vim-textobj-user {{{
if PluginInstalled('vim-textobj-user')
    call textobj#user#plugin('php', {
        \   'code': {
        \       'pattern': ['<?php\>','?>'],
        \       'select-a': 'ap',
        \       'select-i': 'ip',
        \   }
        \ })
    call textobj#user#plugin('datetime', {
        \   'date': {
        \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
        \     'select': ['ad', 'id'],
        \   },
        \   'time': {
        \     'pattern': '\<\d\d:\d\d:\d\d\>',
        \     'select': ['at', 'it'],
        \   },
        \ })
endif
" }}}
" indentLine {{{
if PluginInstalled('indentLine')
    nnoremap <unique> <Leader>il :IndentLinesToggle<CR>
    "let g:indentLine_enabled = 1
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_char = '│'
    let g:indentLine_first_char = '│'
    let g:indentLine_noConcealCursor = 1
    let g:indentLine_faster = 1
    let g:indentLine_fileTypeExclude = []
    let g:indentLine_fileType = ['c','cpp','python']
endif
" }}}
" quicktask {{{
if PluginInstalled('quicktask')
    let g:quicktask_snip_path= '~/snips'
    let g:quicktask_snip_default_filetype = 'markdown'
    nnoremap <unique> <Leader>ti Go# vim:ft=quicktask<Esc><C-o>
endif
" }}}
" hammer {{{
" poor man's hammer
    "autocmd FileType vimwiki,markdown nnoremap <Leader>hh
    autocmd FileType vimwiki,markdown nnoremap <buffer> <Leader>hh
                \ :silent !hammer "%" > "/tmp/%:t.html"<CR>
                \ :silent !xdg-open "/tmp/%:t.html"<CR>
                \ :redraw!<CR>
    "nnoremap <unique> <Leader>hh :Hammer<CR>
" }}}
" vimwiki {{{
if PluginInstalled('vimwiki')
    " use :hammer to have a quick preview of markdown
    " use pandoc to convert markdown to html in batch es
    " use grip to have a instant view of github flavoured markdown
    " use python-markdown extension to support table
    "let g:vimwiki_table_mappings = 1
    "let g:vimwiki_list_mappings = 0
    "let g:vimwiki_header_mode = 1
    let g:vimwiki_autowriteall = 1
    let g:vimwiki_folding = 'expr'
    autocmd FileType vimwiki setlocal foldlevel=1
    " followning <CR> nmap breaks jumping in error window
    "autocmd FileType vimwiki nmap <unique> <CR> <Plug>VimwikiFollowLink
    "autocmd FileType vimwiki nmap <unique> <BS> <Plug>VimwikiGoBackLink
    autocmd FileType vimwiki nmap <buffer> <C-n> <Plug>VimwikiNextLink
    autocmd FileType vimwiki nmap <buffer> <C-p> <Plug>VimwikiPrevLink
    nnoremap <unique> <Leader>vi :VimwikiGenerateLinks<CR>
    nnoremap <unique> <Leader>vg :VimwikiGoto<Space>
    nnoremap <unique> <Leader>vs :VimwikiSearch<Space>
    nnoremap <unique> <Leader>vb :VimwikiBacklinks<CR>
    nnoremap <unique> <Leader>vh :VimwikiAll2HTML<CR>
    nnoremap <unique> <Leader>vt :VimwikiTable<Space>
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
" }}}
" VOoM {{{
if PluginInstalled('VOoM')
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
" }}}
" YouCompleteMe {{{
if PluginInstalled('YouCompleteMe')
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
    let g:ycm_filetype_blacklist = {}
    " XXX: After YouCompleteMe prompt, it disables <C-u>, following line hacks
    " to work around this problem. But later I found it breaks insertion in block
    " visual mode. Now the only way I can think of is to map another key
    " binding to <C-u> :(
    "inoremap <Space> <Space><C-o><Esc>
endif
" }}}
" ctrlp {{{
if PluginInstalled('ctrlp')
    let g:ctrlp_map = '<Leader><Leader>'
    "nnoremap <Leader>p :CtrlP<CR>
    nnoremap <unique> <Leader>pp :CtrlP<CR>
    nnoremap <unique> <Leader>pb :CtrlPBuffer<CR>
    nnoremap <unique> <Leader>pm :CtrlPMRU<CR>
    nnoremap <unique> <Leader>bb :CtrlPBuffer<CR>
    nnoremap <unique> <Leader>mm :CtrlPMRU<CR>
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
" }}}
" vim-fugitive {{{
if PluginInstalled('vim-fugitive')
    nnoremap <unique> <Leader>gs :Gstatus<CR>
    nnoremap <unique> <Leader>gc :Gcommit<CR>
    nnoremap <unique> <Leader>ga :Gcommit -a<CR>
    nnoremap <unique> <Leader>gp :Git push<CR>
    nnoremap <unique> <Leader>gd :Gdiff<CR>
endif
" }}}
" delimitMate {{{
if PluginInstalled('delimitMate')
    "set matchpairs+=<:>
    let delimitMate_expand_space = 1
    let delimitMate_expand_cr = 1
    imap <unique> <C-g><C-g> <Plug>delimitMateS-Tab
    imap <unique> <C-g><C-e> <Plug>delimitMateJumpMany
    autocmd FileType tex let b:delimitMate_quotes = "\" ' ` $"
    "imap <Space> <Plug>delimitMateSpace
    "autocmd FileType vimwiki let b:delimitMate_matchpairs=&matchpairs
    "autocmd FileType vimwiki let b:delimitMate_quotes = "\" ' ` * -"
    "autocmd FileType vimwiki let b:delimitMate_nesting_quotes = ['"','*','-',"'",'`']
    "autocmd FileType c,cpp,java let b:delimitMate_matchpairs=&matchpairs.",=:;"
endif
" }}}
" matchit.zip {{{
if PluginInstalled('matchit.zip')
    "let b:match_words = '<:>,\<if\>:\<else\>:\<endif\>'
endif
" }}}
" vim-powerline {{{
if PluginInstalled('vim-powerline')
    let g:Powerline_symbols = 'fancy'
    let g:Powerline_stl_path_style = 'short'
endif
" }}}
" tagbar {{{
if PluginInstalled('tagbar')
    let g:tagbar_sort = 0
    "autocmd Filetype tagbar,c,cpp,python,ruby,vim nnoremap <buffer> <Tab> :TagbarToggle<CR>
    " following 3 lines make tagbar autofocus only when using :TagbarToggle, 
    " but not when using :TagOpen
    let g:tagbar_autofocus = 0
    nnoremap <unique> <silent> <M-p> :TagbarToggle<CR>
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
" }}}
" nerdcommenter {{{
if PluginInstalled('nerdcommenter')
    "nerdcommenter defined key map, replicated here to avoid overwrite
    "nnoremap <unique> <Leader>cc <Plug><NERDCommenterNested
    "nnoremap <unique> <Leader>ca <Plug><NERDCommenterAltDelims
    "nnoremap <unique> <Leader>cu <Plug><NERDCommenterUncomment
    "nnoremap <unique> <Leader>cb <Plug><NERDCommenterAlignBoth
    "nnoremap <unique> <Leader>cl <Plug><NERDCommenterAlignLeft
    "nnoremap <unique> <Leader>cA <Plug><NERDCommenterAppend
    "nnoremap <unique> <Leader>cy <Plug><NERDCommenterYank
    "nnoremap <unique> <Leader>cs <Plug><NERDCommenterSexy
    "nnoremap <unique> <Leader>ci <Plug><NERDCommenterInvert
    "nnoremap <unique> <Leader>c$ <Plug><NERDCommenterToEOL
    "nnoremap <unique> <Leader>cm <Plug><NERDCommenterMinimal
    "nnoremap <unique> <Leader>cn <Plug><NERDCommenterNested
    "nnoremap <unique> <Leader>c<space> <Plug><NERDCommenterToggle
endif
" }}}
" nerdtree {{{
if PluginInstalled('nerdtree')
    "nnoremap <leader>e :NERDTreeTabsOpen<CR>:NERDTreeSteppedClose<CR>:NERDTreeFind<CR>

    nnoremap <unique> <M-e> :NERDTree %:p:h<CR>
    autocmd FileType nerdtree nnoremap <buffer> <M-e> :NERDTreeClose<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    "let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=0
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
endif
" }}}
" undotree {{{
if PluginInstalled('undotree')
    nnoremap <unique> <M-u> :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1
endif
" }}}
" YankRing.vim {{{
if PluginInstalled('YankRing.vim')
    nnoremap <unique> <M-y> :YRShow<CR>
    "let g:yankring_replace_n_pkey = '<M-p>'
    "let g:yankring_replace_n_nkey = '<M-n>'
    "let g:yankring_zap_keys = '/ ?'
    "let g:yankring_manage_numbered_reg = 1
    "nnoremap <Leader>yc :YRClear<CR>
    "function! YRRunAfterMaps()
        "nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
    "endfunction
endif
" }}}
" tabular {{{
" align table
if PluginInstalled('tabular')
    " :Tabularize /:/l1r0
    " algin by :, insert 1 space to left, and 0 to right.default to l1r1
    "nnoremap <unique> <Leader>a& :Tabularize /&<CR>
    "vnoremap <unique> <Leader>a& :Tabularize /&<CR>
    "nnoremap <unique> <Leader>a= :Tabularize /=<CR>
    "vnoremap <unique> <Leader>a= :Tabularize /=<CR>
    "nnoremap <unique> <Leader>a: :Tabularize /:<CR>
    "vnoremap <unique> <Leader>a: :Tabularize /:<CR>
    "nnoremap <unique> <Leader>a:: :Tabularize /:\zs<CR>
    "vnoremap <unique> <Leader>a:: :Tabularize /:\zs<CR>
    "nnoremap <unique> <Leader>a, :Tabularize /,<CR>
    "vnoremap <unique> <Leader>a, :Tabularize /,<CR>
    "nnoremap <unique> <Leader>a<Bar> :Tabularize /<Bar><CR>
    "vnoremap <unique> <Leader>a<Bar> :Tabularize /<Bar><CR>
endif
" }}}
" sessionman.vim {{{
if PluginInstalled('sessionman.vim')
    set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
    nnoremap <leader>sl :SessionList<CR>
    nnoremap <leader>ss :SessionSave<CR>
endif
" }}}
" cscope conf {{{
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
" }}}
" }}}

let s:vimrc_private = "$HOME/.vimrc-private"
if filereadable(glob( s:vimrc_private ))
    exec 'source '.s:vimrc_private
endif

" vim:ft=vim:fdm=marker
