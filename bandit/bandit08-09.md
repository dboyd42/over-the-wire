bandit8-9
#########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========
The password for the next level is stored in the file data.txt and is the
only line of text that occurs only once

Commands you may need to solve this level:

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

Walkthrough
===========
:sort: -u = deletes copy
:uniq: -u = deletes ALL duplicate lines

.. code-block :: Bash

	# Login to server
	ssh bandit8@bandit.overthewire.org -p 2220
		passwd: <C-b>]	  # If using tmux
		passwd: cvX2JJa4CFALtqS87jk27qwqGhBM9plV

	# Capture the Flag (Method n)
	sort -u data.txt | uniq -u
	sort data.txt | uniq -u
	cat data.txt | sort | uniq -u
    sort data.txt -r | uniq -c | grep '1 '

