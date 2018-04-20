""
" @section Introduction, intro
" This plugin offers a very simple buffer count indicator that one can add to
" their status line, tab line, etc.
"
" If |flagship| is installed, |BufferCountFlag| will be automatically included
" in the window display.
"
" Calling the `BufferCountFlag()` function returns the flag. You can for
" example add the following to your statusline:
" >
"   %{BufferCountFlag()}
" <
" If you have |flagship| installed, the following is invoked automatically:
" >
"   autocmd User Flags call Hoist('window', 10, 'BufferCountFlag')
" <

if exists('g:loaded_buffercount_flag')
  finish
endif
let g:loaded_buffercount_flag = 1

""
" Display format, with %d indicating the visible buffer count. Default: '[B:%d]'
let g:buffercount_flag_format = get(g:, 'buffercount_flag_format', '[B:%d]')

""
" Minimum number of visible buffers to show the flag. If the count is lower,
" nothing will be shown
let g:buffercount_flag_mincount = get(g:, 'buffercount_flag_mincount', 1)


function! BufferCountFlag() abort
  let l:total_visible_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  if l:total_visible_buffers < g:buffercount_flag_mincount
    return ''
  endif
  return printf(g:buffercount_flag_format, l:total_visible_buffers)
endfunction


augroup buffercount_flag_augroup
  autocmd!
  autocmd User Flags call Hoist('window', 10, 'BufferCountFlag')
augroup END
