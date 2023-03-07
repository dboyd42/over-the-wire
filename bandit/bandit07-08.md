bandit7-8
#########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in the file data.txt next to the
word millionth

Commands you may need to solve this level:

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

Walkthrough
===========
:Note: cut's default delimeter is TAB

.. code-block :: Bash

	# Login to server
	ssh bandit7@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

	# Capture the Flag
	grep millionth ./data.txt

