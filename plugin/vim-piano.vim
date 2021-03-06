" piano effect
let s:dir = expand('<sfile>:p:h')
function! PlaySound()
  py import random, vim; vim.command("let number = " + str(random.randint(1, 9)))
  let play = join(["!mplayer -really-quiet ", "/../assets/cmj/"], s:dir)
  let play = join([play, ".aiff &"], number)
  silent! exec play
endfunction

let g:togglePiano = 0
function! TogglePiano()
  let g:togglePiano = 1 - g:togglePiano
  if g:togglePiano == 1
    augroup Piano
      autocmd!
      autocmd CursorMovedI * call PlaySound()
    augroup END
  else
    au! Piano
  endif
endfunction

if !exists('g:togglePianoKey')
  let g:togglePianoKey = "<F8>"
endif
execute "nnoremap" g:togglePianoKey ":call TogglePiano()<CR>"


