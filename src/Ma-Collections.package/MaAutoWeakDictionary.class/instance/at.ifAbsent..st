accessing
at: key ifAbsent: aBlock
	| index asc |
	index := self keyHash: key.
	asc := (array at: index) maFindKey: key.
	(asc isNil or: [ asc isFree ]) ifTrue: [ ^ aBlock value ].
	^ asc value