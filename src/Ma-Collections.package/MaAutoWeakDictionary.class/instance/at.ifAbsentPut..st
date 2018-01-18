accessing
at: key ifAbsentPut: aBlock
	| index asc val |
	index := self keyHash: key.
	
	asc := (array at: index) maFindKey: key.
	
	asc ifNil: [ ^ self atIndex: index insertKey: key value: aBlock value ].
	asc isFree ifFalse: [ ^ asc value ].

	val := aBlock value.
	asc
		finList: list; 
		key: key; 
		value: val.
	tally := tally +1.
	self checkForOverflow.
	^ val
