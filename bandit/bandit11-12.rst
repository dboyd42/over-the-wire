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

.. code-block :: Bash

	# Login to server
	ssh bandit11@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

	# Capture the Flag
	cat data.txt | tr 'a-zA-Z' 'n-za-mN-ZA-M'

