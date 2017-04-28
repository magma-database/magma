SUnit tests
addChildCountAnomaliesTo: aDictionary using: parentRecord

	| bax parentNumberOfChildren isCorrect |
	bax := self baxInParent: parentRecord for: self.
	parentNumberOfChildren := (parentRecord numberOfChildrenAtByteArrayIndex: bax).
	isCorrect := (self lowKey = self highKey or: [ self numberOfChildren = 0 ])
		ifTrue: 
			[ "it's possible for the record not to have an entry in the parent under this condition."
			(parentRecord hasEntryAtByteArrayIndex: bax)
				ifTrue: [ (parentNumberOfChildren - 1) = self numberOfChildren ]
				ifFalse: [ parentNumberOfChildren = self numberOfChildren ] ]
		ifFalse:
			[ (parentNumberOfChildren - 1) = self numberOfChildren ].
	isCorrect ifFalse:
		[ (aDictionary
			at: 'number of children discrepency'
			ifAbsentPut: [ OrderedCollection new ]) add: { parentRecord.  self } ]