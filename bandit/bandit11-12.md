bandit11-12
###########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in the file data.txt, where all
lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

Commands you may need to solve this level:

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

Walkthrough
===========

tr[anslate]
	translates or deletes characters.  The use with the ROT13 is
depicted by the first set transitioning into the second set.  The sets
themselves contain the lowercase alphabet followed by the uppercase alphabet.
Otherwise, you might find that 'A' doesn't follow 'z'!

.. code-block :: Bash

	# Login to server
	ssh bandit11@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

	# Capture the Flag
	cat data.txt | tr 'a-zA-Z' 'n-za-mN-ZA-M'

'Tr'anslate works by covering all your "bases" (letters).  The first option is
your original text, covering all your lowercase (a-z) and uppercase (A-Z).
Then, with the second option, we need to 'tr'anslate (shift) our base letters
by 13.  Refering to the chart below, this will mean that a=n and z=M.
Therfore, shifting our range of lowercase 'a-z' would become 'n-za-m', and
shfiting our range of upercase 'A-Z' would become 'N-M'.  Note: the confusion
lies in the sytax for the end/beg of lowercase<>uppercase in the second part.

Letter = nShifts
----------------

| a = 0
| b = 1
| c = 2
| d = 3
| e = 4
| f = 5
| g = 6
| h = 7
| i = 8
| j = 9
| k = 10
| l = 11
| m = 12
| n = 13
| o = 14
| p = 15
| q = 16
| r = 17
| s = 18
| t = 19
| u = 20
| v = 21
| w = 22
| x = 23
| y = 24
| z = 25

