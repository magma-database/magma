accessing
at: index

	^ self
		at: index
		ifAbsent: [ self error: 'index out of bounds' ]