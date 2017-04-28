accessing
at: key
	| index asc |
	index := self keyHash: key.
	asc := (array at: index) maFindKey: key.
	(asc isNil or: [ asc isFree ]) ifTrue: [ ^ self errorKeyNotFound: key ].
	^ asc value