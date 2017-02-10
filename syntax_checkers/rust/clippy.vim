" Vim syntastic plugin
" Language:     Rust
" Maintainer:   frederic wagner <frederic.wagner@imag.fr>
"
" See for details on how to add an external Syntastic checker:
" https://github.com/scrooloose/syntastic/wiki/Syntax-Checker-Guide#external

if exists("g:loaded_syntastic_rust_clippy_checker")
	finish
endif
let g:loaded_syntastic_rust_clippy_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_rust_clippy_IsAvailable() dict
	return executable(self.getExec())
endfunction

if exists('g:syntastic_extra_filetypes')
	call add(g:syntastic_extra_filetypes, 'rust')
else
	let g:syntastic_extra_filetypes = ['rust']
endif

function! SyntaxCheckers_rust_clippy_GetLocList() dict
	let makeprg = self.makeprgBuild({
				\ 'args': 'clippy -q',
				\ 'fname': '' })

	let errorformat  =
				\ '%E%f:%l:%c: %\d%#:%\d%# %.%\{-}error:%.%\{-} %m,'   .
				\ '%W%f:%l:%c: %\d%#:%\d%# %.%\{-}warning:%.%\{-} %m,' .
				\ '%C%f:%l %m,'

    " New errorformat (after nightly 2016/08/10)
    let errorformat  .=
        \ ',' .
        \ '%-G,' .
        \ '%-Gerror: aborting %.%#,' .
        \ '%-Gerror: Could not compile %.%#,' .
        \ '%Eerror: %m,' .
        \ '%Eerror[E%n]: %m,' .
        \ '%-Gwarning: the option `Z` is unstable %.%#,' .
        \ '%Wwarning: %m,' .
        \ '%Inote: %m,' .
        \ '%C %#--> %f:%l:%c'

    let loclist = SyntasticMake({
				\ 'makeprg': makeprg,
				\ 'errorformat': errorformat })

    let issues = filter(loclist, '!empty(v:val["text"])')

    return issues


endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
			\ 'filetype': 'rust',
			\ 'name': 'clippy',
            \ 'exec': 'cargo'})

let &cpo = s:save_cpo
unlet s:save_cpo
