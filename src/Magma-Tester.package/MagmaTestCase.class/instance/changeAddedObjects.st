test concurrency
changeAddedObjects
	"If this doesn't signal a commit error, then verifyFifthElement better work."
	| commitConflicts |
	[ clientSession noteOldKeysFor: fifthElement.
	fifthElement key: 14.
	clientSession commit ] 
		on: MagmaCommitConflictError
		do: [ : err | commitConflicts := err result commitConflicts ].
	self assert: commitConflicts notNil.
	self assert: commitConflicts size = 1.
	self assert: commitConflicts anyOne conflictingObjects size = 1.
	self assert: commitConflicts anyOne conflictingObjects anyOne key == fifthElement
