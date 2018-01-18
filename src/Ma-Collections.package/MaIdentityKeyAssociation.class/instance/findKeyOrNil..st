as yet unclassified
findKeyOrNil: akey
	^ key == akey ifTrue: [ self ] ifFalse: [ next ifNotNil: [next findKeyOrNil: akey ] ]