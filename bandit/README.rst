Bandit --Steps to Get Through Levels
###########################
:Author: David Boyd
:Date: Mon Oct 28
:Bandit: `Bandit <http://overthewire.org/wargames/bandit/>`_
:Note: Users are bandit1, bandit11, etc

Level 0
=======
:bandit0:bandit0

Level Goal
----------

The goal of this level is for you to log into the game using SSH. The host to
which you need to connect is bandit.labs.overthewire.org, on port 2220. The
username is bandit0 and the password is bandit0. Once logged in, go to the
Level 1 page to find out how to beat Level 1.

Commands you may need to solve this level: ssh

.. code-block :: Bash

	sshpass -p bandit0 ssh bandit0@bandit.labs.overthewire.org -p 2220
	bandit0@bandit:~$ cat readme

	# OR copy files to local machine
	sshpass -p bandit0 scp -P 2220 bandit0@bandit.labs.overthewire.org:~/readme ./passwords/p2.txt

Bandit1: passwords/p2.txt

Level 0-1
=========
:bandit1:boJ9jbbUNNfktd78OOpsqOltutMc3MY1

Level Goal
----------

The password for the next level is stored in a file called readme located in
the home directory. Use this password to log into bandit1 using SSH. Whenever
you find a password for a level, use SSH (on port 2220) to log into that level
and continue the game.

Commands you may need to solve this level: ls, cd, cat, file, du, find

.. code-block :: Bash

	sshpass -f passwords/p1.txt ssh -p 2220 bandit1@bandit.labs.overthewire.org


Level 1-2
=========
:Topic: dashed filename
:Hint: ./-

Level Goal
----------

The password for the next level is stored in a file called - located in the
home directory

Commands you may need to solve this level: ls, cd, cat, file, du, find

.. code-block :: Bash

	sshpass -f passwords/p1.txt scp -P 2220 bandit1@bandit.labs.overthewire.org:~/datafiles/- ./passwords/p2.txt

Bandit3: passwords/p3.txt

Level 2-3
=========
:Note: If passwords/p2.txt was not previously declared, use './-'

Level Goal
----------

The password for the next level is stored in a file called spaces in this
filename located in the home directory

Commands you may need to solve this level: ls, cd, cat, file, du, find

.. code-block :: Bash

	sshpass -f ./passwords/p2.txt scp -P 2220 bandit2@bandit.labs.overthewire.org:~/spaces* ./passwords/p3.txt

	# OR if you copied the exact filename
	sshpass -f ./passwords/p2.txt scp -P 2220 bandit2@bandit.labs.overthewire.org:~/"spaces\ in\ this\ filename" ./passwords/p3.txt

Bandit3: passwords/p3.txt

Level 3-4
=========
:Note: adding a '.' at the end no longer works (2019) due to security issues

Level Goal
----------
:Hint: When copying a directory, you should use the -r option
:Solution: copy the entire directory to search locally

The password for the next level is stored in a hidden file in the inhere
directory.

Commands you may need to solve this level: ls, cd, cat, file, du, find

.. code-block :: Bash

	# Copy remote directory to local machine
	sshpass -f p3.txt scp -r -P 2220 bandit3@bandit.labs.overthewire.org:~/inhere/ ./

	# Move the password file to the preferred directory and filename
	mv inhere/.hidden passwords/p4.txt

	# Delete local directory
	rm -rf inhere/

Bandit4: passwords/p4.txt

Level 4-5
=========

Level Goal
----------

The password for the next level is stored in the only human-readable file in
the inhere directory. Tip: if your terminal is messed up, try the “reset”
command.

Commands you may need to solve this level: ls, cd, cat, **file**, du, find

**file** determines the filetype and displays the output.


.. code-block :: Bash

	# Copy files to local directory
	sshpass -f passwords/p4.txt scp -r -P 2220 bandit4@bandit.labs.overthewire.org:~/inhere/ ./

	# Find human readable file by ascii type
	file inhere/* | grep ASCII

	# Copy file contents into new file
	cp inhere/-file07 passwords/p5.txt

	# Delete local directory
	rm -rf inhere/

Bandit5: passwords/p5.txt

Level 5-6
=========

Level Goal
----------

The password for the next level is stored in a file somewhere under the inhere
directory and has all of the following properties:

	- human-readable
	- 1033 bytes in size
	- not executable

Commands you may need to solve this level: ls, cd, cat, file, du, **find**

**find** searches for files.  Note: when searching for names, you optios -iname

.. code-block :: Bash

	# SSH into the remote server as bandit5 to avoid copying an entire dir
	sshpass -f passwords/p5.txt ssh -p 2220 bandit5@bandit.labs.overthewire.org

	# Find the file
	find -readable -size 1033c ! -executable	# inhere/maybehere07/.file2

	# Find and Cat (alternative)
	find ./ -readable -size 1033c ! -executable -exec cat {} +
	find ./ -readable -size 1033c ! -executable -exec cat -n {} \;

	exit

	# Copy the file to the local machine
	sshpass -f passwords/p5.txt scp -P 2220 bandit5@bandit.labs.overthewire.org:~/inhere/maybehere07/.file2 ./passwords/p6.txt

Bandit6: passwords/p6.txt

Level 6-7
=========

Level Goal
----------

The password for the next level is stored somewhere on the server and has all
of the following properties:

	- owned by user bandit7
	- owned by group bandit6
	- 33 bytes in size

Commands you may need to solve this level: ls, cd, cat, file, du, **find**, grep

**find** can also search for groups and sizes.

.. code-block :: Bash

	# SSH into Bandit6 to avoid copying an entire file system
	sshpass -f passwords/p6.txt ssh -p 2220 bandit6@bandit.labs.overthewire.org

	# Quick and Easy find
	find / -user bandit7 -group bandit6 -size 33c -exec cat {} + 2>/dev/null

	# Jump to the root directory
	cd /

	# Use stderr to filter 'Permission denied' tags
	find -user bandit7 -group bandit6 -size 33c 2>/dev/null

	exit

	# Copy file to local machine
	sshpass -f p6.txt scp -P 2220 bandit6@bandit.labs.overthewire.org:/var/lib/dpkg/info/bandit7.password ./passwords/p7.txt

Bandit7: passwords/p7.txt


Level 7-8
=========
:Tip: Use 'cut' to select a --field from grep
:Note: cut's default delimeter is TAB

Level Goal
----------

The password for the next level is stored in the file data.txt next to the
word millionth

Commands you may need to solve this level: grep, sort, uniq, strings, base64,
tr, tar, gzip, bzip2, xxd

.. code-block :: Bash

	sshpass -f passwords/p7.txt scp -P 2220 bandit7@bandit.labs.overthewire.org:~/data.txt ./datafiles/data7-8.txt

	# Grep "millionth" and 'cut' the second column
	grep "millionth" datafiles/data7-8d.txt | cut -f 2 > passwords/p8.txt

Bandit8: passwords/p8.txt

Level 8-9
=========
:Note: sort -u -> deletes copy; uniq -u -> deletes ALL duplicate lines

Level Goal
----------

The password for the next level is stored in the file data.txt and is the only
line of text that occurs only once

Commands you may need to solve this level: grep, sort, uniq, strings, base64,
tr, tar, gzip, bzip2, xxd


.. code-block :: Bash

	# Quick and Easy
	cat data.txt | sort | uniq -u

	sshpass -f passwords/p8.txt scp -P 2220 bandit8@bandit.labs.overthewire.org:~/data.txt ./datafiles/data8-9.txt

	# Sort then print only unique lines
	sort datafiles/data8-9.txt | uniq -u > passwords/p9.txt

Bandit9: passwords/p9.txt

Level 9-10
==========
:strings: strings commands finds all the human-readable strings within a file.

+-----+-------------+
| cut | Description |
+=====+=============+
| -f  | --field     |
+-----+-------------+
| -d  | --delimeter |
+-----+-------------+

Level Goal
----------

The password for the next level is stored in the file data.txt in one of the
few human-readable strings, beginning with several ‘=’ characters.

Commands you may need to solve this level: grep, sort, uniq, strings, base64,
tr, tar, gzip, bzip2, xxd

.. code-block :: Bash

	# Quick and Easy
	grep === data.txt

	sshpass -f passwords/p9.txt scp -P 2220 bandit9@bandit.labs.overthewire.org:~/data.txt ./datafiles/data9-10.txt

	# Display password position
	strings datafiles/data9-10.txt | grep ====

	# Extract password position and write to file
	strings datafiles/data9-10.txt | grep ==== | cut -d ' ' -f 2 | tail -n 1 > passwords/p10.txt

Bandit10: passwords/p10.txt

Level 10-11
===========

Level Goal
----------

The password for the next level is stored in the file data.txt, which contains
base64 encoded data

Commands you may need to solve this level: grep, sort, uniq, strings, base64,
tr, tar, gzip, bzip2, xxd

.. code-block :: Bash

	# Quick and Easy
	base64 --decode data.txt

	sshpass -f passwords/p10.txt scp -P 2220 bandit10@bandit.labs.overthewire.org:~/data.txt ./datafiles/data10-11.txt

	# Decode the base64 text and display password position
	base64 --decode datafiles/data10-11.txt

	# Extract password and write to file
	base64 --decode datafiles/data10-11.txt | cut -d ' ' -f 4 > passwords/p11.txt

Bandit11: p11.txt

Level 11-12
===========

Level Goal
----------

The password for the next level is stored in the file data.txt, where all
lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

Commands you may need to solve this level: grep, sort, uniq, strings, base64,
**tr**, tar, gzip, bzip2, xxd

**tr[anslate]** - translates or deletes characters.  The use with the ROT13 is
depicted by the first set transitioning into the second set.  The sets
themselves contain the lowercase alphabet followed by the uppercase alphabet.
Otherwise, you might find that 'A' doesn't follow 'z'!

.. code-block :: Bash

	# Quick and Easy
	cat data.txt | tr 'a-zA-Z' 'n-za-mN-ZA-m'

	sshpass -f passwords/p11.txt scp -P 2220 bandit11@bandit.labs.overthewire.org:~/data.txt ./datafiles/data11-12.txt

	# Rot13 using 'tr'anslate and write to file
	cat datafiles/data11-12.txt | tr 'a-zA-Z' 'n-za-mN-ZA-M' | cut -d ' ' -f 4 > passwords/p12.txt

Bandit12: passwords/p12.txt

Level 12-13
===========
:Note: You have file editing privileges in /tmp/

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

Level Goal
----------

The password for the next level is stored in the file data.txt, which is a
hexdump of a file that has been repeatedly compressed. For this level it may
be useful to create a directory under /tmp in which you can work using mkdir.
For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename
it using mv (read the manpages!)

Commands you may need to solve this level: grep, sort, uniq, strings, base64,
tr, **tar**, **gzip**, **bzip2**, **xxd**, mkdir, cp, mv, file

**xxd** - make a hexdump or do the reverse.

**tar**, **gzip**, **bzip2** are used for de/compression files.

.. code-block :: Bash

	sshpass -f passwords/p12.txt scp -P 2220 bandit12@bandit.labs.overthewire.org:~/data.txt ./datafiles/data12-13.txt

	# Reverse the hexdump
	xxd -r datafiles/data12-13.txt > tempFile

	# while (file != ASCII)
		# file tempFile
		# tempFile: <*zip*>  # Extensions: gz, bzip, tar
		# mv tempFile to tempFile.<*zip-Extension*>
		# gunzip / bzip2 -d / tar xvf  tempFile.<*zip-Extension*>

	# Write password to file --phew!
	cat datafiles/data8 | cut -d ' ' -f 4 > passwords/p13.txt

The goal is to uncompress the filetype until there are no more compressions.

Bandit13: passwords/p13.txt

Level 13-14
===========

Level Goal
----------













