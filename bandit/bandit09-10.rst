bandit9-10
##########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in the file data.txt in one of the
few human-readable strings, beginning with several ‘=’ characters.

Commands you may need to solve this level:

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

Walkthrough
===========
:strings: find all the human-readable strings within a file

.. code-block :: Bash

	# Login to server
	ssh bandit9@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

	# Capture the Flag
	strings data.txt | grep === | cut -d ' ' -f2

