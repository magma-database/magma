accessing
addValue: aNumber 
	"Add aNumber in to the active stat (that for the most recent past) that is still being tallied."
	^ self guard critical: 
		[ self isActive 
			ifTrue: [ active addValue: aNumber ]
			ifFalse: [ aNumber ] ]