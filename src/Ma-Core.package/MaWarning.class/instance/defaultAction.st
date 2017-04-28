as yet unclassified
defaultAction
	Smalltalk isHeadless
		ifTrue: [ self resume ]
		ifFalse: [ super defaultAction ]