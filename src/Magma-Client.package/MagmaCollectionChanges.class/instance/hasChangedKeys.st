testing
hasChangedKeys

	^(changes includesKey: #changedKeys) and: [ self changedKeys notEmpty ]
