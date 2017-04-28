cached object access
cachedObjectAfter: anObject 
self maMarked: 'delete'.
	self expression isClause ifFalse: [ ^ super cachedObjectAfter: anObject ].
	^ (self segmentObjects
		at: (self indexOfCachedObject: anObject) + 1
		ifAbsent: [ nil ]) value