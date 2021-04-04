" Contents: Functions for window managment(resizing)

" Resize function ofr windows to do it with Ctrl + h/j/k/l
" Couldnt find a plugin that doesn't resize the command line and other plugins
" had features that i didn't really need, or are confusng
function ResizeWith(cmd)
    let l:vim_size_horz = &columns
    let l:vim_size_vert = &lines
    let l:spl_dims = [winheight(0),winwidth(0)]
    let l:win_coords_u = win_screenpos(0)
    let l:layout = winlayout()
    let l:winid = win_getid(0)
    let l:cmd_heigth_size = &cmdheight + 1
    let l:exists_tabline = 0
    if tabpagenr('$')>1 && &showtabline == 1
        let l:cmd_heigth_size = l:cmd_heigth_size + 1
        let l:exists_tabline = 1
    endif
    if a:cmd == 'k'
        " is full vertical window
        if l:spl_dims[0] + 2 + l:exists_tabline == l:vim_size_vert
            echo ""
        else
            if l:win_coords_u[0] == (1 + l:exists_tabline)
                :resize -1
                redraw
            elseif l:spl_dims[0] + l:win_coords_u[0] + 1 == l:vim_size_vert
                :resize +1
                redraw
            endif 
        endif 
    elseif a:cmd == 'j'
        " is full vertical window
        if l:spl_dims[0] + 2 + l:exists_tabline == l:vim_size_vert
            echo ""
        else
            " is upper window
            if l:win_coords_u[0] == (1 + l:exists_tabline)
                :resize +1
                redraw
            " is lower window
            elseif l:spl_dims[0] + l:win_coords_u[0] + 1 == l:vim_size_vert
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
