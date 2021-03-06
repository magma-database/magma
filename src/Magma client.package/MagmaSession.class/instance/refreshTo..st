private
refreshTo: repositoryCommitNumber 
	"Refresh all objects in the image retrieved by this session with their copies in the repository."
	"When a session has been offline for sometime, many of the objects it has in its oid Dictionary's could be out of date, and doing an abort after reconnecting won't update them because refreshes are only performed from transient information in the server (the repository's 'transactionLog').
	Therefore, bring my view up to date."
	guard critical: 
		[ self isWayBehind 
			ifTrue: 
				[ self refreshMyKnownObjects.
				self commitNumber: repositoryCommitNumber ]
			ifFalse: 
				[ [ self tryToRefreshTo: repositoryCommitNumber ] 
					on: MagmaUnavailableCommitRecord
					do: [ : err | self refreshMyKnownObjects ] ] ]