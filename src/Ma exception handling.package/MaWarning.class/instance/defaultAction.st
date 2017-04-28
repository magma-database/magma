as yet unclassified
defaultAction
	SmalltalkImage current maIsHeadless
		ifTrue: [ self resume ]
		ifFalse: [ super defaultAction ]