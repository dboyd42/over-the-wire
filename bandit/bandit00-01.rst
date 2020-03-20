bandit0-1
#########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The goal of this level is for you to log into the game using SSH. The host to which you need to connect is bandit.labs.overthewire.org, on port 2220. The username is bandit0 and the password is bandit0. Once logged in, go to the Level 1 page to find out how to beat Level 1.

Commands you may need to solve this level

ssh

Walkthrough
===========

.. code-block :: Bash

	# Login to server
	ssh bandit0@bandit.overthewire.org -p 2220
		passwd: bandit0

	# Get bandit1 passwd
	cat readme

	# Tmux copy to system clipboard
	<C-b>]		# Enter vi mode
	<Space>		# Start visual copy
	<Enter>		# Copy text

