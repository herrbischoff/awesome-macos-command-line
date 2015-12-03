<img src="https://cdn.rawgit.com/herrbischoff/awesome-osx-command-line/master/assets/logo.svg" width="600">

# Functions

> An assorted collection of useful OS X specific Bash-style functions. Part of [Awesome OS X Command Line](https://github.com/herrbischoff/awesome-osx-command-line).

## Table of Contents

- [Finder](#finder)


## Finder

### Get Path of Frontmost Finder Window
```bash
function finder_path {
    osascript -e 'tell application "Finder"'\
        -e "if (${1-1} <= (count Finder windows)) then"\
        -e "get POSIX path of (target of window ${1-1} as alias)"\
        -e 'else' \
        -e 'get POSIX path of (desktop as alias)'\
        -e 'end if' \
        -e 'end tell';
}
```


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
