links
ensureCanonicalizedMagmaId: aMagmaId 
	"If aMagmaId is already present in one of my other links, use it instead."
	^ aMagmaId = self magmaId 
		ifTrue: [ self magmaId ]
		ifFalse: 
			[ self links 
				maDetect: [ : each | each = aMagmaId ]
				ifFound: [ : found | found ]
				ifNone: [ self links add: aMagmaId ] ]