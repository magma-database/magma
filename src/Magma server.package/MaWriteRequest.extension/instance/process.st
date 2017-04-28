*magma server
process
	| commitLogEntry |
	self restoreMode ifFalse: 
		[ " MagmaEnvironmentError signal: 'Only repositories in restoreMode are updated in this way.' "
		"Not signaling an error because, after a #takeOverAsPrimary, there will be unavoidable extranneous WriteRequests left-over in the queue.  It's easier just to ignore them for the test cases.  Also, WriteRequests are never checked for a response anyway, the sender of a WriteREquest would never know there was an error."
		^ nil ].
	commitLogEntry := self recoveryManager materializeCommitLogEntryIn: commitLogRecord.
	
	[ self repository 
		write: commitLogEntry
		logged: true
		commitLogRecord: commitLogRecord.
	self session advanceWith: commitLogEntry ] 
		on: MagmaWrongCommitNumber
		do: 
			[ : err | 
			"console ensureCorrectNodeConfiguration"
			"<-- probably overkill"
			err expectedCommitNumber < commitLogRecord commitNumber 
				ifTrue: 
					[ "Gap fill"
					repositoryController 
						catch: console thisLocation
						upTo: repositoryController node primaryLocation ]
				ifFalse: 
					[ MagmaNotification signal: ('Received commitNumber ' , commitLogRecord commitNumber asString , ' but need ' , err expectedCommitNumber asString) ] ]