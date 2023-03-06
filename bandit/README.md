# Bandit

> Author: David Boyd<br>
> Update: 2023-03-06<br>
> Date: 2021-08-29

Reading a lot of new information is key!

Process of continuing:

1. `man <cmd>` // manpages
2. `help <x>`  // built-in shell help page
3. Search-engines

## Tips 'n Tricks

1. Use `tmux` to copy the password into the buffer

2. When running through the levels sequentially:
   
Method #1:

   - `i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220`

Method #2:

  - `P=<paste password>`
  - `sshpass -p $P ssh bandit$(((N+=1)))@bandit.labs.overthewire.org -p 2220`

