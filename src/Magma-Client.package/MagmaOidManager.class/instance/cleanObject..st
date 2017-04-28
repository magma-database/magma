private
cleanObject: anObject 
	super cleanObject: anObject.
	newObjects
		removeKey:
			(newOids
				removeKey: anObject
				ifAbsent: [ ^ self ])
		ifAbsent: [  ]