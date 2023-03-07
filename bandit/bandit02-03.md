# Bandit Level 2 :arrow_right: 3

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal

The password for the next level is stored in a file called spaces in this
filename located in the home directory
Commands you may need to solve this level

ls, cd, cat, file, du, find

# Walkthrough

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

# Get flag
cat sp<\t>                      # Method 1 - Autocompletion
cat spaces\ in\ this\ filename  # Method 2 - Escape whack for whitespaces
cat "spaces in this filename"   # Method 3 - Quotes
  [<<] aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG
```
