as yet unclassified
assertChanged: anObject
	self assert: (barrier isDirty: anObject)