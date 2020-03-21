bandit11-12
###########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

Commands you may need to solve this level

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
