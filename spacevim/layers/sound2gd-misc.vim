"=============================================================================
" sound2gd-misc --- NAME layer file for SpaceVim
" Copyright (c) 2012-2016 Shidong Wang & Contributors
" Author: sound2gd <429354772@qq.com>
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

function! SpaceVim#layer#sound2gd-misc#plugins() abort
  let plugins = []
  return plugins
endfunction

function! SpaceVim#layer#sound2gd-misc#config() abort
  inoremap <C-f> <Right>
  inoremap <C-b> <Left>
  inoremap <C-n> <Down>
  inoremap <C-p> <Up>
endfunction

