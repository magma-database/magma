accessing
at: anIndex

	^ self
		at: anIndex
		ifAbsent: [ self error: 'index out of range' ]