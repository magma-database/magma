private non-collection samples
blockSamples
	| temp |
	temp := 'hello'->'world'.
	^ {[ : a : b | a name > b name ].
	[ : nm | Smalltalk at: nm ].
	[ self class name ].
	[ temp key asUppercase -> temp value asUppercase ].
	[ interval select: [ : each | each even ] ] }