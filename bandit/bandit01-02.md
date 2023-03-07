# Bandit Level 1 :arrow_right: 2

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

## Level Goal

The password for the next level is stored in a file called - located in the
home directory

Commands you may need to solve this level

ls, cd, cat, file, du, find

## Walkthrough

``` bash
# Login to server (faster method)
i=0
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] boJ9jbbUNNfktd78OOpsqOltutMc3MY1

# Get bandit2 passwd
cat ./-     # Method 1
cat ./*     # Method 2
  [<<] rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi
```
