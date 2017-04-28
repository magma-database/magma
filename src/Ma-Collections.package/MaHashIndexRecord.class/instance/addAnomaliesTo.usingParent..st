SUnit tests
addAnomaliesTo: aDictionary usingParent: parentRecord

	| originalCount |
	originalCount := aDictionary size.
	self
		addChildCountAnomaliesTo: aDictionary
		using: parentRecord.
	^aDictionary size > originalCount