bandit12-13
###########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)

Commands you may need to solve this level

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv, file

Walkthrough
===========
:Note: You have file editing privileges in mkdir /tmp/<some-dir>/
:xxd: make a hexdump or do the reverse
:tar, gzip, bzip2: used for de/compression files

+-----+---------------------------------------------+
| tar | Description                                 |
+=====+=============================================+
| z   | means (un)z̲ip.                              |
+-----+---------------------------------------------+
| x   | means ex̲tract files from the archive.       |
+-----+---------------------------------------------+
| v   | means print the filenames v̲erbosely.        |
+-----+---------------------------------------------+
| f   | means the following argument is a f̱ilename. |
+-----+---------------------------------------------+

.. code-block :: Bash

	# Login to server
	ssh bandit12@bandit.overthewire.org -p 2220
		passwd: <C-b>]      # If using tmux
		passwd: 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu

	###
	# Capture the Flag
	###
	# Set up workspace
	mkdir /tmp/some-folder/
	cp data.txt /tmp/some-folder/
	cd /tmp/some-folder/

	# Determine file
	file data.txt
	head data.txt
	xxd -r data.txt temp

	###
	# Loop until File == POSIX
	###
		# Determine file
		file temp

		# If gunzip file
		mv temp t.gz
		gunzip t.gz

		# Else If bzip2
		bzip2 -d t				## newfile t.out

	# If POSIX
	tar -xvf t				## newfile data5.bin (POSIX file)
	tar -xvf data5.bin			## newfile data6.bin (POSIX file)
	tar -xvf data6.bin			## newfile data8.bin (gzip file)
	
	# Final
	mv data8.bin t.gz
	gunzip t.gz
