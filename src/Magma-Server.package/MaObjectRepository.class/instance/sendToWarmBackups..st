high-availability
sendToWarmBackups: aMaCommitLogRecord 
	"Update my warmBackups with aMaCommitLogEntry."
	repositoryController node secondaryLocationsDo: 
		[ : each | 
		"Asynchronous request!  Only a send error will detect a problem."
		[ (self node sessionFor: each) write: aMaCommitLogRecord ] 
			on: NetworkError "this is a send-only request, there will be no response and no server-generated error (i.e., we can't handle MagmaWrongCommitNumber)."
			do: [ : err | MagmaNodeUpdate signalRemove: each ] ]