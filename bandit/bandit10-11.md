# Bandit 10 :arrow_right: 11

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal

The password for the next level is stored in the file data.txt, which
contains base64 encoded data

Commands you may need to solve this level:

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

# Walkthrough

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s

# Capture the Flag
base64 -d data.txt
  [<<] 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM
```
