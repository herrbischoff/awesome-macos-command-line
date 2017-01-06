<img src="https://cdn.rawgit.com/herrbischoff/awesome-osx-command-line/master/assets/logo.svg" width="600">

# Snippets

> An assorted collection of useful Bash-style command chains, ready to cut and paste.  
> Part of [Awesome OS X Command Line](https://github.com/herrbischoff/awesome-osx-command-line).

## Table of Contents

- [Text Manipulation](#text-manipulation)
    - [Extract Unique Words from Text File](#extract-unique-words-from-text-file)


## Text Manipulation

### Extract Unique Words from Text File
```bash
grep -o -E '\w+' <file> | sort -u -f
```


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
