# Bandit 8 :arrow_right: 9

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal
The password for the next level is stored in the file data.txt and is the
only line of text that occurs only once

Commands you may need to solve this level:

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

# Walkthrough

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] TESKZC0XvTetK0S9xNwm25STk5iWrBvP

# Capture the Flag (Method n)
sort data.txt | uniq -u
  [<<] EN632PlfYiZbn3PhVK3XOGSlNInNE00t
```
