bandit5-6
#########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in a file somewhere under the
inhere directory and has all of the following properties:

	- human-readable
	- 1033 bytes in size
	- not executable

Walkthrough
===========
:find: searches for files

.. code-block :: Bash

	# Login to server
	ssh bandit5@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: koReBOKuIDDepwhWk7jZC0RTdopnAYKh

	# Capture the Flag (Method 1)
	find -readable -size 1033c ! -executable -exec cat {} +
	# Capture the Flag (Method n)
	find ./inhere/* -size 1033c ! -perm 111 | xargs -L1 file -h
	find ./inhere/* -size 1033c ! -perm 111 -readabale -exec {} +

	# Tmux copy to system clipboard
	<C-b>]		# Enter vi mode
	<Space>		# Start visual copy
	<Enter>		# Copy text

