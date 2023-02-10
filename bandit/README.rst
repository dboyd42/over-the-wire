Bandit
######
:Author: David Boyd
:Date: 2021-08-29

Reading a lot of new information is key!

Process of continuing:

1. `man <cmd>` // manpages
2. `help <x>`  // built-in shell help page
3. Search-engines

## Tips 'n Tricks

1. Use `tmux` to copy the password into the buffer
2. When running through the levels sequentially, use this one-liner:
   `i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220`
