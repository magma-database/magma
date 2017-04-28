building
add: anObject asChildOf: aParentObject 
	parents 
		at: anObject
		put: aParentObject.
	(children 
		at: aParentObject
		ifAbsentPut: [ self newChildCollection ]) in: [ : immediateChildren | (immediateChildren includes: anObject) ifFalse: [ immediateChildren add: anObject ] ].
	children 
		at: anObject
		ifAbsentPut: [ self newChildCollection ].
	^ anObject