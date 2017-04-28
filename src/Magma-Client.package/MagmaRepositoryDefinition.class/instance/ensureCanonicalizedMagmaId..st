links
ensureCanonicalizedMagmaId: aMagmaId 
	"If aMagmaId is already present in one of my other links, use it instead."
	^ aMagmaId = self magmaId 
		ifTrue: [ self magmaId ]
		ifFalse: 
			[ self links 
				detect: [ : each | each = aMagmaId ]
				ifNone: [ self links add: aMagmaId ] ]