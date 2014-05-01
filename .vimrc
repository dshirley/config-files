" Start off on the right foot - Use vim defaults (not vi compatible)
set nocompatible

" Window look and feel
syntax on
colorscheme elflord			" Custom light scheme (in ~/.vim/colors)

" Set current tab to be highlighted in green
hi TabLineSel ctermfg=LightGreen ctermbg=Black

set foldcolumn=2			" Num columns allocated for folding
set foldmethod=indent			" Fold based on indentation
set laststatus=2			" In Multi-window mode always display status bars
set nofoldenable			" All folds start in the open state
set nowrap				" Do not wrap text
set nu					" Display line numbers
set numberwidth=5			" Num columns for line numbers
set ruler				" Display current cursor position
set hlsearch

"set diffopt+=iwhite

" Save session
" '20 	save marks
" <50	num lines to save for each register
" s10	size to save for registers
" h	disable hlsearc highlighting when starting
" %20	save the buffer list
set viminfo='20,<50,s10,h,%20

if has("gui_running")
	if has("x11")
		colorscheme proton
		set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
	endif
endif

" Tabs, wrapping, etc
set encoding=utf-8
set autoindent				" Indent based on previous line
set lcs=tab:\|⋅,extends:▷,precedes:◁	" Set custom control characters
set linebreak				" Break lines at spaces
set list				" List controll characters
set shiftwidth=2			" Default indent is 8 columns
set smartindent				" Try to guess the next line's indentation 
set smarttab				" Inserts spaces at beginning of line based on 'expandtab'
set tabstop=2				" Default tab is 8 columns
set softtabstop=2
set expandtab

au! BufRead,BufNewFile *.thpl	set filetype=perl

"filetype on
au FileType objc	set tabstop=2 softtabstop=2 textwidth=80 shiftwidth=2 expandtab
au FileType perl	set tabstop=4 softtabstop=4 textwidth=80 shiftwidth=4 expandtab shiftround comments+=s:#,mb:#,ex:# 
au FileType cc		set tabstop=4 shiftwidth=2 textwidth=130 expandtab
au FileType c		set tabstop=8 shiftwidth=8 noexpandtab
au FileType python	set tabstop=4 shiftwidth=4
au FileType java 	set tabstop=4 shiftwidth=4
au FileType text 	set textwidth=80


" Setup cscope 
set cscopeprg=/usr/software/rats/bin/cscope-15.6
"cscope add /u/dshirley/p4/rr1_fixes/tools/bedrock/export/common/cscope/cscope.out
"cscope add /u/dshirley/p4/sn/tools/bedrock/export/common/cscope/cscope.out


" Setup 'open' commands to accept wildcards
" - shamelessly stollen from siderop1's vimrc file
command! -complete=file -nargs=+ Etabs call s:ETW('tabnew', <f-args>)
command! -complete=file -nargs=+ Ewindows call s:ETW('new', <f-args>)
command! -complete=file -nargs=+ Evwindows call s:ETW('vnew', <f-args>)
command! -complete=file -nargs=+ Edit call s:ETW('edit', <f-args>)

function! s:ETW(what, ...)
	for f1 in a:000
		let files = glob(f1)
		if files == ''
			execute a:what . ' ' . escape(f1, '\ "')
		else
			for f2 in split(files, "\n")
				execute a:what . ' ' . escape(f2, '\ "')
			endfor
		endif
	endfor
endfunction
