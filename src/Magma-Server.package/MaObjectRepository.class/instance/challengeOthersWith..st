actions
challengeOthersWith: aMaCommitLogEntry 
	| entriesToRemove |
	entriesToRemove := transactionLog 
		challenge: self restoreMode not
		entriesWith: aMaCommitLogEntry.
	entriesToRemove ifNotNil: 
		[ entriesToRemove do: 
			[ : each | 
			each isSystem 
				ifTrue: [ repositoryController refreshView ]
				ifFalse: [ self removeSessionFor: each sessionId ] ] ]