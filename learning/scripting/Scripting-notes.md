# Shell Scripts

[ShellCheck](https://www.shellcheck.net/) | finds bugs in your shell scripts

`chmod u+x filename` | to make file executable, but *for owner only*

`chmod a+x filename` | to make file executable, *for all*

`#!` | shebang or hashbang

`#! /bin/bash`, `#! /usr/bin/env zsh` | specifies wich interpreter to run

`-x` | add to shebang to debug script

`$variable1` | to invoke `variable1` value

`$1` | first parameter on a command, `$2` | second parameter, etc.
`--` | end of options

## Conditionals

`if <command> ; then <command> ; else <command> ; fi`

`if [[ <condition> ]] ; then <command> ; else <command> ; fi`