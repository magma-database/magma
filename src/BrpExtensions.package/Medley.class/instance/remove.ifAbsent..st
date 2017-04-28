removing
remove: anObject ifAbsent: anExceptionBlock 
	collections do:
		[ : eachOuter | eachOuter isCollection
			ifTrue:
				[ (eachOuter includes: anObject) ifTrue: [ ^ eachOuter remove: anObject ] ]
			ifFalse:
				[ anObject = eachOuter ifTrue: [ ^ collections remove: eachOuter ] ] ].
	^ anExceptionBlock value