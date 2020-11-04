Over the Wire
##############
:Author: David Boyd
:Date: Tue Oct 29
:Website: `Over the Wire <http://overthewire.org/wargames/>`_

This repo hold the documentation for proceeding through Over the Wire's challenges.

+-----------+----------+------------+--------------+
| Games     | Progress | Start Date | Current Date |
+===========+==========+============+==============+
| Bandit    | 20 / 34  | 2019/10    |              |
+-----------+----------+------------+--------------+
| Leviathan |          |            |              |
+-----------+----------+------------+--------------+
| Natas     |          |            |              |
+-----------+----------+------------+--------------+
| Krypton   |          |            |              |
+-----------+----------+------------+--------------+
| Narnia    |          |            |              |
+-----------+----------+------------+--------------+
| Behemoth  |          |            |              |
+-----------+----------+------------+--------------+
| Utumno    |          |            |              |
+-----------+----------+------------+--------------+
| Maze      |          |            |              |
+-----------+----------+------------+--------------+
| Vortex    |          |            |              |
+-----------+----------+------------+--------------+
| Semtex    |          |            |              |
+-----------+----------+------------+--------------+
| Manpage   |          |            |              |
+-----------+----------+------------+--------------+
| Drifter   |          |            |              |
+-----------+----------+------------+--------------+

General Notes
#############

sshpass, scp
============

.. code-block :: Bash

	# SSH using a password from CLI
	sshpass -p <passwd> ssh <user>@<host> -p <port#>

	# SSH using a password from CLI
	sshpass -f <filename> ssh <user>@<host> -p <port#>

	# Copy files to local machine from SSH
	scp -P <port#> <user>@<host>:~/path/to/file <./local/path/to/local/file>

	# sshpass and scp one liner (example)
	sshpass -f p3.txt scp -r -P 2220 bandit3@bandit.labs.overthewire.org:~/inhere/p4.txt ./p4.txt

