function! ale_linters#php#linter#Handle(buffer, lines) abort
    let l:pattern = '.\+ on line \(\d\+\) \(.\+\)'
    let l:output = []
    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:obj = {
        \   'lnum': l:match[1] + 0,
        \   'col': 0,
        \   'type': 'W',
        \   'text': l:match[2],
        \}
        call add(l:output, l:obj)
    endfor
    return l:output
endfunction

call ale#linter#Define('json', {
\   'name': 'linter',
\   'executable': 'linter',
\   'output_stream': 'stdout',
\   'command': '%e %s',
\   'callback': 'ale_linters#php#linter#Handle',
\})

call ale#linter#Define('php', {
\   'name': 'linter',
\   'executable': 'linter',
\   'output_stream': 'stdout',
\   'command': '%e %s',
\   'callback': 'ale_linters#php#linter#Handle',
\})
