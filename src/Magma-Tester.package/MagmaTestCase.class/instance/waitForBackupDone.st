test high-availability function
waitForBackupDone
	[ magmaConsole controller isFullBackupRunning ] whileTrue: [ 5 seconds asDelay wait ]