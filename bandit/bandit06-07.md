# Bandit 6 :arrow_right: 7

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal

The password for the next level is stored somewhere on the server and has all
of the following properties:

	- owned by user bandit7
	- owned by group bandit6
	- 33 bytes in size

Commands you may need to solve this level

ls, cd, cat, file, du, find, grep

# Walkthrough
:find: can also search for users, groups, and sizes

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU

# Capture the Flag
find /* -user bandit7 -group bandit6 -size 33c 2>/dev/null -exec cat {} +
  [<<] z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S
```
