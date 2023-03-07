# Bandit 7 :arrow_right: 8

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal

The password for the next level is stored in the file data.txt next to the
word millionth

Commands you may need to solve this level:

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

# Walkthrough
:Note: cut's default delimeter is TAB

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S

# Capture the Flag
grep millionth ./data.txt
  [<<] TESKZC0XvTetK0S9xNwm25STk5iWrBvP
```
