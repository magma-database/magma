actions
anchorGraphDo: aBlock 
	| shouldClose |
	shouldClose := false.
	repositoryController ifNil:
		[ shouldClose := true.
		self open ].
	self
		graphFrom: (repositoryController requestCritical: [ self repository filer anchorOid ])
		do: aBlock.
	shouldClose ifTrue: [ self close ]