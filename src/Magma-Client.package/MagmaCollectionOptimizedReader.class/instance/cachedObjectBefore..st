cached object access
cachedObjectBefore: anObject 
self maMarked: 'delete'.
	self expression isClause ifFalse: [ ^ super cachedObjectBefore: anObject ].
	^ (self segmentObjects
		at: (self indexOfCachedObject: anObject) - 1
		ifAbsent: [ nil ]) value