bandit2-3
#########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in a file called spaces in this filename located in the home directory
Commands you may need to solve this level

ls, cd, cat, file, du, find

Walkthrough
===========

.. code-block :: Bash

	# Login to server
	ssh bandit2@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

	cat sp<\t>

	# Tmux copy to system clipboard
	<C-b>]		# Enter vi mode
	<Space>		# Start visual copy
	<Enter>		# Copy text

