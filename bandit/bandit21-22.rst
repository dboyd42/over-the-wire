Bandit Level 21 → Level 22
##########################

Level Goal
==========

A program is running automatically at regular intervals from cron, the
time-based job scheduler. Look in /etc/cron.d/ for the configuration and see
what command is being executed.

Commands you may need to solve this level:

cron, crontab, crontab(5) (use “man 5 crontab” to access this)))

Walkthrough
===========

.. code-block :: Bash

	# Vars
	TM="bandit.labs.overthewire.org -p 2220"

	# Login to server
	sshpass -p gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr ssh bandit21@$TM

	# Capture the Flag
	ls /etc/cron.d/
		> cronjob_bandit15_root  cronjob_bandit22  cronjob_bandit24
		> cronjob_bandit17_root  cronjob_bandit23  cronjob_bandit25_root
	cat /etc/cron.d/cronjob_bandit22
		> @reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
		> * * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
	cat /usr/bin/cronjob_bandit22.sh
		> #!/bin/bash
		> chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
		> cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
	cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
		> Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI

