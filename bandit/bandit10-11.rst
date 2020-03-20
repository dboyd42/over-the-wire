bandit10-11
#######
:Author: David Boyd
:Date: 2020-03-20



Level Goal
==========

The password for the next level is stored in the file data.txt, which contains base64 encoded data

Commands you may need to solve this level

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd


Walkthrough
===========

.. code-block :: Bash

	# Login to server
	ssh bandit10@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

	# Capture the Flag
	base64 --decode data.txt

