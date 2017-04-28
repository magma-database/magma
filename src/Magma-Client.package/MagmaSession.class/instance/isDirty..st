testing
isDirty: anObject 
	"Answer whether anObject is persistent in this session and changed from its last-read buffer state."
	^ (anObject maIsLargeCollection and: [ anObject changes hasChanges ]) or: [ transaction didChange: anObject ]