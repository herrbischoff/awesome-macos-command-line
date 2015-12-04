<img src="https://cdn.rawgit.com/herrbischoff/awesome-osx-command-line/master/assets/logo.svg" width="600">

# Functions

> An assorted collection of useful OS X specific Bash-style functions. Part of [Awesome OS X Command Line](https://github.com/herrbischoff/awesome-osx-command-line).

## Table of Contents

- [Finder](#finder)
    - [Get Path of Frontmost Finder Window](#get-path-of-frontmost-finder-window)
    - [Set Current Directory's Finder View to Column View](#set-current-directorys-finder-view-to-column-view)
    - [Set Current Directory's Finder View to Icon View](#set-current-directorys-finder-view-to-icon-view)
    - [Set Current Directory's Finder View to List View](#set-current-directorys-finder-view-to-list-view)


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

### Set Current Directory's Finder View to Column View

```bash
function column_view {
    osascript -e 'set cwd to do shell script "pwd"'\
      -e 'tell application "Finder"'\
      -e "if (${1-1} <= (count Finder windows)) then"\
      -e "set the target of window ${1-1} to (POSIX file cwd) as string"\
      -e "set the current view of the front Finder window to column view"\
      -e 'else' -e "open (POSIX file cwd) as string"\
      -e "set the current view of the front Finder window to column view"\
      -e 'end if' -e 'end tell';
}
```

### Set Current Directory's Finder View to Icon View

```bash
function icon_view {
    osascript -e 'set cwd to do shell script "pwd"'\
      -e 'tell application "Finder"'\
      -e "if (${1-1} <= (count Finder windows)) then"\
      -e "set the target of window ${1-1} to (POSIX file cwd) as string"\
      -e "set the current view of the front Finder window to icon view"\
      -e 'else' -e "open (POSIX file cwd) as string"\
      -e "set the current view of the front Finder window to icon view"\
      -e 'end if' -e 'end tell';
};
```

### Set Current Directory's Finder View to List View

```bash
function list_view {
  osascript -e 'set cwd to do shell script "pwd"'\
    -e 'tell application "Finder"'\
    -e "if (${1-1} <= (count Finder windows)) then"\
    -e "set the target of window ${1-1} to (POSIX file cwd) as string"\
    -e "set the current view of the front Finder window to list view"\
    -e 'else' -e "open (POSIX file cwd) as string"\
    -e "set the current view of the front Finder window to list view"\
    -e 'end if' -e 'end tell';\
}
```

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
