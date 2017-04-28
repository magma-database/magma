building
value: anObject 
	| value |
	^ (value := self rawValue: anObject) isString 
		ifTrue: [ self formattedValue: value ]
		ifFalse: [ self formattedValue: value printString ]