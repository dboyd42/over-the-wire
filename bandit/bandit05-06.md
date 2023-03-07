# Bandit 5 :arrow_right: 6

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal

The password for the next level is stored in a file somewhere under the
inhere directory and has all of the following properties:

	- human-readable
	- 1033 bytes in size
	- not executable

# Walkthrough

`find` searches for files

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR

# Capture the Flag (Method 1)
find ./ -readable -size 1033c \! -executable -exec cat {} +
  [<<] P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU
```
