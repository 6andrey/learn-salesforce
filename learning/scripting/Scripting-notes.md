# Shell Scripts

## Links
[ShellCheck](https://www.shellcheck.net/) | finds bugs in your shell scripts

[8 Bash Script Tips for Automation Project](towardsdatascience.com/8-bash-script-tips-for-automation-projects-2c63d8716f9a)

[27 Simple Bash Scripting Tips for Beginners](betterprogramming.pub/27-simple-bash-scripting-tips-for-beginners-d6764c977546)

## Commands

`chmod u+x filename` | to make file executable, but *for owner only*

`chmod a+x filename` | to make file executable, *for all*

`#!` | shebang or hashbang

`#! /bin/bash`, `#! /usr/bin/env zsh` | specifies wich interpreter to run

`-x` | add to shebang to debug script

`$variable1` | to invoke `variable1` value

`$1` | first parameter on a command, `$2` | second parameter, etc.
`--` | end of options

### Conditionals

`if <command> ; then <command> ; else <command> ; fi`

`if [[ <condition> ]] ; then <command> ; else <command> ; fi`