accessing
cachedObjectAfter: anObject 
	| found |
self maMarked: 'delete'.
	found := false.
	self segmentObjects do:
		[ : each | found ifTrue: [ ^ each value ].
		each value = anObject ifTrue: [ found := true ] ].
	^ nil