accessing
subcontextNamed: aString 
	^ (subcontexts detect: [ : each | each name = aString ]) in: 
		[ : foundSubcontext | 
		(didRefresh and: [ foundSubcontext isRunning not ]) ifTrue: [ foundSubcontext refresh ].
		foundSubcontext ]