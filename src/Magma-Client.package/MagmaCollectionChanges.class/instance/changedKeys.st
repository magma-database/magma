changed keys
changedKeys
	"answer an OrderedCollection of MaChangedKeySpecification's."

	^changes
		at: #changedKeys
		ifAbsentPut: [ OrderedCollection new: 1 ]