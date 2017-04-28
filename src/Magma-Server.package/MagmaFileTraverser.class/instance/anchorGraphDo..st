actions
anchorGraphDo: aBlock 
	| shouldClose |
	objectCount := 0.
	shouldClose := false.
	repositoryController ifNil:
		[ shouldClose := true.
		self open ].
	[ self
		graphFrom: (repositoryController requestCritical: [ self repository filer anchorOid ])
		do: aBlock ] ensure:
		[ shouldClose ifTrue: [ self close ] ]