testing
= aMagmaId 
	self == aMagmaId ifTrue: [ ^ true ].
	aMagmaId maOriginalClass = self maOriginalClass ifFalse: [ ^ false ].
	^ uuid = aMagmaId uuid