Bandit Level 20 → Level 21
##########################

Overview
========
:URL: https://www.howtogeek.com/440848/how-to-run-and-control-background-processes-on-linux/
:Ctrl+C: Sends SIGINT, signal 2, to the process—if it is accepting input—and tells it to terminate.
:Ctrl+D: Sends SISQUIT, signal 3, to the process—if it is accepting input—and tells it to quit.
:Ctrl+Z: Sends SIGSTP, signal 20, to the process and tells it to stop (suspend) and become a background process.
:jobs: Lists the background jobs and shows their job number.
:bg job_number: Restarts a background process. If you don’t provide a job number the last process that was turned into a background task is used.
:fg job_number: brings a background process into the foreground and restarts it. If you don’t provide a job number the last process that was turned into a background task is used.
:commandline &: Adding an ampersand & to the end of a command line executes that command as a background task, that is running.
:kill %job_number: Sends SIGTERM, signal 15, to the process to terminate it.
:kill 9 %job_number: Sends SIGKILL, signal 9, to the process and terminates it abruptly.

To put current process into background:
---------------------------------------

.. code-block:: Bash

	# Stop the current process
	<C-z>
	# Put in background
	bg <#>		// or bg <empty> will place default (+) prc into bg

Level Goal
==========

There is a setuid binary in the homedirectory that does the following: it makes
a connection to localhost on the port you specify as a commandline argument. It
then reads a line of text from the connection and compares it to the password
in the previous level (bandit20). If the password is correct, it will transmit
the password for the next level (bandit21).

NOTE: Try connecting to your own network daemon to see if it works as you think

Commands you may need to solve this level:

ssh, nc, cat, bash, screen, tmux, Unix ‘job control’ (bg, fg, jobs, &, CTRL-Z,
…)

Walkthrough
===========

.. code-block :: Bash

	# Vars
	TM="bandit.labs.overthewire.org -p 2220"

	# Login to server
	sshpass -p GbKksEFF4yrVs6il55v6gwY5aVje5f0j ssh bandit20@$TM

	###
	### Capture the Flag
	###
	# Run the listener as a background prc using nc
	echo "GbKksEFF4yrVs6il55v6gwY5aVje5f0j" | nc -l 127.0.0.1 -p 1234 &
		> [1] 26693

	# Verify bg prc
	ps aux
		> USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
		> bandit20 23613  0.0  0.1  21204  5032 pts/9    Ss   03:06   0:00 -bash
		> bandit20 26693  0.0  0.0   6300  1600 pts/9    S    03:15   0:00 nc -l 127.0.0.1 -p 1234
		> bandit20 26699  0.0  0.0  19188  2356 pts/9    R+   03:15   0:00 ps aux

	# Run the SUID bin with pre-defined port number
	./suconnect 1234
		> Read: GbKksEFF4yrVs6il55v6gwY5aVje5f0j
		> Password matches, sending next password
		> gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr

Alternative Walkthrough
=======================
:Note: To list bg "jobs", use cmd: jobs

You can also do it "backwards".

.. code-block:: Bash

	# Set up the listener in the bg
	nc -l localhost -p 4444 &
	> [1] 17523

	# Run the SUID prgm in the bg
	./suconnect 4444 &
	> [2] 17584

	# Bring the listener (job #1) to the foreground
	fg 1
	> nc -l localhost -p 4444

	# Enter Bandit19's password
	GbKksEFF4yrVs6il55v6gwY5aVje5f0j
		> Read: GbKksEFF4yrVs6il55v6gwY5aVje5f0j
		> Password matches, sending next password
		>  gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr
		>[2]+  Done                    ./suconnect 4444

