" Contents: Functions for window managment(resizing)

let g:choosewin_overlay_enable = 1

" Allows override for resizing cmd heigth when resizing up or down
if !exists("g:AllowCmdheightResize")
    let g:AllowCmdheightResize = 0
endif

" Resize function ofr windows to do it with Ctrl + h/j/k/l
" Couldnt find a plugin that doesn't resize the command line and other plugins
" had features that i didn't really need, or are confusng
function ResizeWith(cmd)
    let l:vim_size_horz = &columns
    let l:vim_size_vert = &lines
    let l:spl_dims = [winwidth(0),winheight(0)]
    let l:win_coords_u = win_screenpos(0)
    if tabpagenr('$')!=1 && &showtabline == 1
        let l:win_coords_u[0] -= 1
    endif
    let l:cmd_heigth_size = &cmdheight + 1
    let l:win_coords_d = [win_coords_u[0] + spl_dims[0] - 1,win_coords_u[1] + spl_dims[1] - 1]
    let l:real_heigth = l:vim_size_vert - l:cmd_heigth_size
    if a:cmd == 'k'
        if l:win_coords_u[0] == 1 && l:win_coords_d[1] == l:real_heigth  && g:AllowCmdheightResize == 0
            echo ""
        else
            if l:win_coords_u[0] == 1
                :resize -1
                redraw
            else
                :resize +1
                redraw
            endif 
        endif 
    elseif a:cmd == 'j'
        if l:win_coords_u[0] == 1 && l:win_coords_d[1] == l:real_heigth && g:AllowCmdheightResize == 0
            echo ""
        else
            if l:win_coords_u[0] ==1
                :resize +1
                redraw
            else
                :resize -1
                redraw
            endif
        endif
    elseif a:cmd == 'h'
        if l:win_coords_u[1] >= l:vim_size_vert
            :vertical resize +1
            redraw
        else
            :vertical resize -1
            redraw
        endif
    elseif a:cmd == 'l'
        if l:win_coords_u[1] >= l:vim_size_vert
            :vertical resize -1
            redraw
        else
            :vertical resize +1
            redraw
        endif
    endif
endfunction
