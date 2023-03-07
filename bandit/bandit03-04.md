# Bandit 3 :arrow_right: 4

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal

The password for the next level is stored in a hidden file in the inhere
directory.  Commands you may need to solve this level:

ls, cd, cat, file, du, find

# Walkthrough

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG

# Capture the flag
cat inhere/.hidden      # Method 1 - Tab completion
  [<<] 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe
```
