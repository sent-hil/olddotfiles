# psql
# Autogenerated from man page /usr/share/man/man1/psql.1
# using Deroffing man parser
complete -c psql -s a -l echo-all --description 'Print all input lines to standard output as they are read.'
complete -c psql -s A -l no-align --description 'Switches to unaligned output mode.'
complete -c psql -s c -l command --description 'Specifies that psql is to execute one command s… [See Man Page]'
complete -c psql -s d -l dbname --description 'Specifies the name of the database to connect to.'
complete -c psql -s e -l echo-queries --description 'Copy all SQL commands sent to the server to sta… [See Man Page]'
complete -c psql -s E -l echo-hidden --description 'Echo the actual queries generated by d and othe… [See Man Page]'
complete -c psql -s f -l file --description 'Use the file filename as the source of commands… [See Man Page]'
complete -c psql -s F -l field-separator --description 'Use separator as the field separator for unaligned output.'
complete -c psql -s h -l host --description 'Specifies the host name of the machine on which… [See Man Page]'
complete -c psql -s H -l html --description 'Turn on HTML tabular output.'
complete -c psql -s l -l list --description 'List all available databases, then exit.'
complete -c psql -s L -l log-file --description 'Write all query output into file filename, in a… [See Man Page]'
complete -c psql -s n -l no-readline --description 'Do not use readline for line editing and do not… [See Man Page]'
complete -c psql -s o -l output --description 'Put all query output into file filename.'
complete -c psql -s p -l port --description 'Specifies the TCP port or the local Unix-domain… [See Man Page]'
complete -c psql -s P -l pset --description 'Specifies printing options, in the style of pset.'
complete -c psql -s q -l quiet --description 'Specifies that psql should do its work quietly.'
complete -c psql -s R -l record-separator --description 'Use separator as the record separator for unaligned output.'
complete -c psql -s s -l single-step --description 'Run in single-step mode.'
complete -c psql -s S -l single-line --description 'Runs in single-line mode where a newline termin… [See Man Page]'
complete -c psql -s t -l tuples-only --description 'Turn off printing of column names and result ro… [See Man Page]'
complete -c psql -s T -l table-attr --description 'Specifies options to be placed within the HTML table tag.'
complete -c psql -s U -l username --description 'Connect to the database as the user username in… [See Man Page]'
complete -c psql -s v -l set -l variable --description 'Perform a variable assignment, like the set internal command.'
complete -c psql -s V -l version --description 'Print the psql version and exit.'
complete -c psql -s w -l no-password --description 'Never issue a password prompt.'
complete -c psql -s W -l password --description 'Force psql to prompt for a password before conn… [See Man Page]'
complete -c psql -s x -l expanded --description 'Turn on the expanded table formatting mode.'
complete -c psql -s X -l no-psqlrc --description 'Do not read the start-up file (neither the syst… [See Man Page]'
complete -c psql -s 1 -l single-transaction --description 'When psql executes a script with the -f option,… [See Man Page]'
complete -c psql -s '?' -l help --description 'Show help about psql command line arguments, and exit.'
complete -c psql -l ----------+---------+----------+--------------------------- --description ' pg_catalog | version | function | PostgreSQL v… [See Man Page]'
complete -c psql -o 'a.' --description 'queries, psql merely prints all queries as they… [See Man Page]'
complete -c psql -o 'e.' --description 'ECHO_HIDDEN.'
complete -c psql -o 'E.)' --description 'noexec, the queries are just shown but are not … [See Man Page]'
complete -c psql -o 'q.' --description 'SINGLELINE.'
complete -c psql -o 'S.' --description 'SINGLESTEP.'
complete -c psql -o 's.' --description 'USER.'
complete -c psql -l ---------+---------+-------------------- --description ' first     | integer | not null default 0  seco… [See Man Page]'
complete -c psql -l -----+-------- --description '     1 | one      2 | two      3 | three      4… [See Man Page]'
complete -c psql -l --- -l ---- --description '    1 one     2 two     3 three     4 four (4 rows).'
complete -c psql -s '[' --description 'first  | 1 second | one.'

