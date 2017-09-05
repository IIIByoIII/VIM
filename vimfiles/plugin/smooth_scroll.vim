" Smooth Scrolling
nnoremap <c-d> :call DelayedFunc("normal! Mgjzz",winheight(".")/ 2-1,16)<cr>
nnoremap <c-u> :call DelayedFunc("normal! Mgkzz",winheight(".")/ 2-1,16)<cr>

func! DelayedFunc(cmd,...)
    " cmd , iter , delay
    let iter=10
    let delay=20
    if a:0 == 2
        let iter = a:1
        let delay = a:2
    endif
    let i = 0
    " first section
    let ot = iter/5*4
    let start = range(100,0,eval(-100/(ot-1)))
    " second section
    let tt = iter - ot
    let end = range(0,100,eval(100/(tt-1)))
    " list of speeds
    let speed = start + end
    if a:cmd != ""
        while i < iter
            execute a:cmd
            try
                exec "sleep " . eval(delay*speed[i]/100) . "m"
            catch *
            endtry
            let i = i + 1
            redraw
        endwhile
    endif
endfunc 
