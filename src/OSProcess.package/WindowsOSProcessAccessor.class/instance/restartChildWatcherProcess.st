child process management
restartChildWatcherProcess

	grimReaper ifNotNilDo: [ :p | p terminate. grimReaper := nil ].
	self grimReaperProcess