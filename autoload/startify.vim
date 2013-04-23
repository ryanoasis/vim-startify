" Plugin:      https://github.com/mhinz/vim-startify
" Description: Start screen displaying recently used stuff.
" Maintainer:  Marco Hinz <http://github.com/mhinz>
" Version:     0.5

if exists('g:autoloaded_startify') || &cp
  finish
endif
let g:autoloaded_startify = 1

function! startify#save_session() abort
  let spath = g:startify_session_dir .'/'. input('Save under this session name: ') | redraw
  if filereadable(spath)
    echo 'Session already exists. Overwrite?  [y/n]' | redraw
    if nr2char(getchar()) == 'y'
      execute 'mksession! '. spath | echo 'Session saved under: '. spath
    else
      echo 'Did NOT save the session!'
    endif
  else
    execute 'mksession '. spath | echo 'Session saved under: '. spath
  endif
endfunction

function! startify#load_session() abort
  let spath = g:startify_session_dir .'/'. input('Load this session: ') | redraw
  if filereadable(spath)
    execute 'source '. spath
  else
    echo 'No such file!'
  endif
endfunction

" vim: et sw=2 sts=2
