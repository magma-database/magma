accessing
classForId: anInteger ifAbsent: aBlock

	^ anInteger <= minimumClasses size
		ifTrue:
			[ minimumClasses at: anInteger ]
		ifFalse:
			[ classesById
				at: anInteger
				ifAbsent: aBlock ]