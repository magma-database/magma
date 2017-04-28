added indexes
newIndexValues
	"A dictionary of Dictionarys, (attribute Symbol -> (key->oid)...) used to
	populate all new indexes being built in this transaction."

	^changes
		at: #newIndexValues
		ifAbsentPut: [ Dictionary new ]
