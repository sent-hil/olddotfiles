# ag
# Autogenerated from man page /usr/local/share/man/man1/ag.1
# using Deroffing man parser
complete -c ag -l ackmate: --description '     Output results in a format parseable by Ac… [See Man Page]'
complete -c ag -s a -l all-types: --description '     Search all files.'
complete -c ag -s A -l after --description '     Print lines before match.  Defaults to 2.'
complete -c ag -s B -l before --description '     Print lines after match.  Defaults to 2.'
complete -c ag -l '[no]break:' --description '     Print a newline between matches in different files.'
complete -c ag -l '[no]color:' --description '     Print color codes in results.  Enabled by default.'
complete -c ag -l column: --description '     Print column numbers in results.'
complete -c ag -s C -l context --description '     Print lines before and after matches.  Defaults to 2.'
complete -c ag -s D -l debug: --description '     Output ridiculous amounts of debugging info.'
complete -c ag -l depth --description '     Search up to NUM directories deep.  Default is 25.'
complete -c ag -s f -l follow: --description '     Follow symlinks.'
complete -c ag -l '[no]group' --description '.'
complete -c ag -s g --description '     Print filenames matching PATTERN.'
complete -c ag -s G -l file-search-regex --description '     Only search filenames matching PATTERN.'
complete -c ag -l '[no]heading' --description '.'
complete -c ag -l hidden: --description '     Search hidden files.  This option obeys ignore files.'
complete -c ag -l ignore --description '     Ignore files/directories matching this pattern.'
complete -c ag -l ignore-dir --description '     Alias for --ignore for compatibility with ack.'
complete -c ag -s i -l ignore-case: --description '     Match case insensitively.'
complete -c ag -s l -l files-with-matches: --description '     Only print filenames containing matches, n… [See Man Page]'
complete -c ag -s L -l files-without-matches: --description '     Only print filenames that don\'t contain matches.'
complete -c ag -s m -l max-count --description '     Skip the rest of a file after NUM matches.'
complete -c ag -l no-numbers: --description '     Don\'t show line numbers.'
complete -c ag -s p -l path-to-agignore --description '     Provide a path to a specific . agignore file.'
complete -c ag -l pager --description '     Use a pager such as less.  Use --nopager to override.'
complete -c ag -l print-long-lines: --description '     Print matches on very long lines (> 2k cha… [See Man Page]'
complete -c ag -s Q -l literal: --description '     Do not parse PATTERN as a regular expression.'
complete -c ag -s s -l case-sensitive: --description '     Match case sensitively.  Enabled by default.'
complete -c ag -s S -l smart-case: --description '     Match case sensitively if there are any up… [See Man Page]'
complete -c ag -l search-binary: --description '     Search binary files for matches.'
complete -c ag -l stats: --description '     Print stats (files scanned, time taken, etc).'
complete -c ag -s t -l all-text: --description '     Search all text files.  This doesn\'t include hidden files.'
complete -c ag -s u -l unrestricted: --description '     Search all files.  This ignores . agignore, .'
complete -c ag -s U -l skip-vcs-ignores: --description '     Ignore VCS ignore files (. gitigore, .'
complete -c ag -s v -l invert-match --description '.'
complete -c ag -s w -l word-regexp: --description '     Only match whole words.'
