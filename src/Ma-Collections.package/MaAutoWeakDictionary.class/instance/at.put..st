accessing
at: key put: value
	| index asc |
	index := self keyHash: key.
	
	asc := (array at: index) maFindKey: key.
	asc ifNil: [ ^ self atIndex: index insertKey: key value: value ].
	asc isFree ifFalse: [ asc value: value. ^ value ].

	" fill the free association "	
	asc
		finList: list; 
		key: key; 
		value: value.
	tally := tally +1.
	self checkForOverflow.
	^ value
