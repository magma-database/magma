as yet unclassified
findKeyOrNil: akey
	^ self key == akey ifTrue: [ self ] ifFalse: [ next ifNotNil: [next findKeyOrNil: akey ] ]