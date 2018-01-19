child process management
restartChildWatcherProcess

	grimReaper ifNotNil: [ :p | p terminate. grimReaper := nil ].
	self grimReaperProcess