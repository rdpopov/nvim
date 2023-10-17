function! s:goyo_enter()
    let g:goyo_mode_winbar = v:true
    set winbar=""
    exe ":Gitsigns toggle_signs"
endfunction

function! s:goyo_leave()
    let g:goyo_mode_winbar = v:false
    exe ":Gitsigns toggle_signs"
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()