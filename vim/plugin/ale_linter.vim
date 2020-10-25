if exists("g:did_plugin_ale_linter")
  finish
endif
let g:did_plugin_ale_linter = 1

function! AleGenericLinter(buffer, lines) abort
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

let s:linter_configuration = {
\   'name': 'linter',
\   'executable': 'linter',
\   'output_stream': 'stdout',
\   'command': '%e %s',
\   'lint_file': 1,
\   'callback': "AleGenericLinter",
\}

call ale#linter#Define('conf', s:linter_configuration)
call ale#linter#Define('css', s:linter_configuration)
call ale#linter#Define('go', s:linter_configuration)
call ale#linter#Define('html', s:linter_configuration)
call ale#linter#Define('javascript', s:linter_configuration)
call ale#linter#Define('json', s:linter_configuration)
call ale#linter#Define('markdown', s:linter_configuration)
call ale#linter#Define('php', s:linter_configuration)
call ale#linter#Define('python', s:linter_configuration)
call ale#linter#Define('ruby', s:linter_configuration)
call ale#linter#Define('sh', s:linter_configuration)
call ale#linter#Define('text', s:linter_configuration)
call ale#linter#Define('twig', s:linter_configuration)
call ale#linter#Define('typescript', s:linter_configuration)
call ale#linter#Define('vue', s:linter_configuration)
call ale#linter#Define('yaml', s:linter_configuration)
