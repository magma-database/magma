private
mergeChanges
	self isSorted 
		ifTrue: [ self mergeChangesSorted ]
		ifFalse: [ self mergeChangesUnsorted ]