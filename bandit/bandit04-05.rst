bandit4-5
#########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.
Commands you may need to solve this level

ls, cd, cat, file, du, find

Walkthrough
===========
:file: determines the filetype and displays the output.

.. code-block :: Bash

	# Login to server
	ssh bandit4@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: pIwrPrtPN36QITSp3EQaw936yaFoFgAB

	# Capture the Flag
	file inhere/* | grep ASCII
	cat ./-file07

	# Tmux copy to system clipboard
	<C-b>]		# Enter vi mode
	<Space>		# Start visual copy
	<Enter>		# Copy text

