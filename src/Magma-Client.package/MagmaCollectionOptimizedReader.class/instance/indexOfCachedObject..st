cached object access
indexOfCachedObject: anObject 
	self expression isClause ifFalse: [ ^ super indexOfCachedObject: anObject ].
	^ self indexOfCachedObjectAtKey: ((self collection indexNamed: expression attribute) indexObjectFor: anObject)