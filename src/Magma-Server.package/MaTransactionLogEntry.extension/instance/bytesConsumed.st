*magma-server
bytesConsumed
	"When I'm removed from the TransactionLog, how many bytes will be recovered from my 'commitPackage'.  Since only MaCommitLogEntry's have them, 0."
	^ challengingEntries
		ifNil: [ 0 ]
		ifNotNil:
			[ challengingEntries
				inject: 0
				into:
					[ : sum : each | sum + each bytesConsumed ] ]