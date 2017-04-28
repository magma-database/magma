actions
restore
	"restore all changed objects to their state as read from the repository."
	largeCollectionChanges do: [ : each | each reset ].
	self suspendWriteBarrierModifiedsWhile: 
		[ readSet keysAndValuesDo: 
			[ : eachOriginal : eachBackup | 
			eachBackup
				refresh: eachOriginal realObjectIfMutatingProxy
				using: session
				includingLocal: true ] ]