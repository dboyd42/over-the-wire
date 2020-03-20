bandit1-2
#########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in a file called - located in the home directory

Commands you may need to solve this level

ls, cd, cat, file, du, find

Walkthrough
===========

.. code-block :: Bash

	# Login to server
	ssh bandit1@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: boJ9jbbUNNfktd78OOpsqOltutMc3MY1

	# Get bandit2 passwd
	cat ./-

	# Tmux copy to system clipboard
	<C-b>]		# Enter vi mode
	<Space>		# Start visual copy
	<Enter>		# Copy text

