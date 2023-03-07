# Bandit 4 :arrow_right: 5

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal

The password for the next level is stored in the only human-readable file in
the inhere directory. Tip: if your terminal is messed up, try the “reset”
command.  Commands you may need to solve this level:

ls, cd, cat, file, du, find

# Walkthrough
:file: determines the filetype and displays the output.

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe

# Capture the Flag
file inhere/*
cat ./inhere/-file07
  [<<] lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR
```
