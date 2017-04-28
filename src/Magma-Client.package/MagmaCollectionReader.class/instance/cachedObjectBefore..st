accessing
cachedObjectBefore: anObject 
	| prior | prior := nil.
self maMarked: 'delete'.
	self segmentObjects do:
		[ : each | each value = anObject ifTrue: [ ^ prior ].
		prior := each value ].
	^ nil